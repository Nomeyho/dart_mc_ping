import 'dart:io';
import 'dart:typed_data';

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:dart_mc_ping/packet/handshake_packet.dart';
import 'package:dart_mc_ping/packet/packet.dart';
import 'package:dart_mc_ping/packet/ping_packet.dart';
import 'package:dart_mc_ping/packet/pong_packet.dart';
import 'package:dart_mc_ping/packet/request_packet.dart';
import 'package:dart_mc_ping/packet/response_packet.dart';
import 'package:fixnum/fixnum.dart';
import 'package:logging/logging.dart';
import 'package:raw/raw.dart';

/// Minecraft socket client.
class McClient {
  static final log = Logger('McClient');
  static final timeout = Duration(seconds: 10);

  final String _host;
  final int _port;
  Socket _socket;
  Stream<Uint8List> _socketStream;

  McClient(this._host, this._port);

  connect() async {
    _socket = await Socket.connect(_host, _port, timeout: timeout);
    _socketStream = _socket.asBroadcastStream();
    log.fine("Connected to $_host:$_port");
  }

  Future<Packet> _readPacket() async {
    final List<int> buffer = List();

    /// Wait that all data are received
    await for (List<int> data in _socketStream) {
      buffer.addAll(data);

      if(data.length < 2) {
        continue;
      }

      final RawReader reader = RawReader.withBytes(buffer);
      final int size = reader.readVarUint();
      final int id = reader.readVarUint();
      log.finer('Received packet $id (${buffer.length} / $size bytes)');

      if (buffer.length >= size) {
        break;
      }
    }

    /// Read header and payload
    final RawReader reader = RawReader.withBytes(buffer);
    final int size = reader.readVarUint();
    final int id = reader.readVarUint();

    final Uint8List payload = Uint8List(size - 1); // ID is always on 1 byte
    for (int i = 0; i < size - 1; ++i) {
      payload[i] = reader.readUint8();
    }
    log.finest('Read payload of packet id=$id (size=$size): $payload');

    /// Decode packet
    Packet packet;
    switch (id) {
      case 0:
        packet = ResponsePacket();
        break;
      case 1:
        packet = PongPacket();
        break;
      default:
        throw Exception('Unexpected packet with ID ${id}');
    }

    packet.decode(payload);
    log.fine('Received $packet');
    return packet;
  }

  void _writePacket(Packet packet) {
    log.fine('Sending $packet');
    final Uint8List data = packet.encode();
    final int dataLen = data.length;

    final RawWriter packetWriter = RawWriter.withCapacity(1024);
    packetWriter.writeVarUint(dataLen + 1);
    packetWriter.writeVarUint(packet.id);
    packetWriter.writeBytes(data);

    final int bytesLen = packetWriter.length;
    final Uint8List bytes = packetWriter.toUint8ListView().sublist(0, bytesLen);

    log.finest('Sending bytes: $bytes');
    _socket.add(bytes);
  }

  Future<StatusResponse> ping() async {
    /// status
    final handshake = HandshakePacket(4, _host, _port, 1);
    _writePacket(handshake);
    final request = RequestPacket();
    _writePacket(request);
    final response = await _readPacket() as ResponsePacket;

    /// ping
    final ping = PingPacket(_now);
    _writePacket(ping);
    final pong = await _readPacket() as PongPacket;

    response.response.ms = (_now - pong.now).toInt();
    return response.response;
  }

  get _now => Int64(DateTime.now().millisecondsSinceEpoch);

  close() async {
    await _socket.close();
    log.fine("Connection closed");
  }
}
