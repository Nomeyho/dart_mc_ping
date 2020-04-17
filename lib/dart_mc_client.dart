import 'dart:io';
import 'dart:typed_data';

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:dart_mc_ping/packet/handshake_packet.dart';
import 'package:dart_mc_ping/packet/packet.dart';
import 'package:dart_mc_ping/packet/request_packet.dart';
import 'package:dart_mc_ping/packet/response_packet.dart';
import 'package:logging/logging.dart';
import 'package:raw/raw.dart';

class McClient {
  static final log = Logger('McClient');

  final String _host;
  final int _port;
  Socket _socket;

  McClient(this._host, this._port);

  connect() async {
    _socket = await Socket.connect(_host, _port);
    log.info("Connected to $_host:$_port");
  }

  Future<Packet> _readPacket() async {
    final List<int> buffer = List();

    /// Wait that all data are received
    await for (List<int> data in _socket.asBroadcastStream()) {
      buffer.addAll(data);

      final RawReader reader = RawReader.withBytes(buffer);
      final int size = reader.readVarUint();
      final int id = reader.readVarUint();
      log.fine('Received packet $id (${buffer.length} / $size bytes)');

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
    log.finer('Read payload of packet id=$id (size=$size): $payload');

    /// Decode packet
    switch (id) {
      case 0:
        final response = ResponsePacket();
        response.decode(payload);
        return response;
      default:
        throw Exception('Unexpected packet with ID ${id}');
    }
  }

  _writePacket(Packet packet) {
    final Uint8List data = packet.encode();
    final int dataLen = data.length;

    final RawWriter packetWriter = RawWriter.withCapacity(1024);
    packetWriter.writeVarUint(dataLen + 1);
    packetWriter.writeVarUint(packet.id);
    packetWriter.writeBytes(data);

    final int bytesLen = packetWriter.length;
    final Uint8List bytes = packetWriter.toUint8ListView().sublist(0, bytesLen);

    log.finer('Writing packet id=${packet.id}: $bytes');
    _socket.add(bytes);
  }

  Future<StatusResponse> ping() async {
    final handshake = HandshakePacket(4, _host, _port, 1);
    _writePacket(handshake);
    log.info('Handshake performed');

    final request = RequestPacket();
    _writePacket(request);
    log.info('Request packet sent');

    final response = await _readPacket();
    if (response is ResponsePacket) {
      log.info('Received response packet');
      return response.response;
    }
    throw Exception('Unexpected packet: $response');
  }

  close() async {
    await _socket.close();
    log.info("Connection closed");
  }
}
