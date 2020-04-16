import 'dart:io';
import 'dart:typed_data';

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:dart_mc_ping/packet/handshake_packet.dart';
import 'package:dart_mc_ping/packet/packet.dart';
import 'package:dart_mc_ping/packet/request_packet.dart';
import 'package:dart_mc_ping/packet/response_packet.dart';
import 'package:raw/raw.dart';

class McClient {
  static const BUFFER_SIZE = 8092;

  final String _host;
  final int _port;
  Socket _socket;
  List<int> _byteBuffer = List();

  McClient(this._host, this._port);

  connect() async {
    _socket = await Socket.connect(_host, _port);
    _socket.listen(_onData);
  }

  _onData(Uint8List data) {
    _byteBuffer.addAll(data);

    RawReader reader = RawReader.withBytes(_byteBuffer);
    int size = reader.readVarUint();
    int id = reader.readVarUint();
    print('Received packet $id (${_byteBuffer.length}/$size bytes)');
  }

  Future<Packet> _readPacket() async {
    RawReader reader = RawReader.withBytes(_byteBuffer);
    int size = reader.readVarUint();
    int id = reader.readVarUint();

    print('Reading packet $id ($size bytes)');
    await Future.doWhile(() {
      // print('${_byteBuffer.lengthInBytes} / ${size}');
      return _byteBuffer.length >= size;
    }); // TODO

    ByteData bytes =
        reader.readByteDataCopy(size - 1); // assuming ID is always on 1 byte
    Uint8List data = bytes.buffer.asUint8List();
    print('read ${data}');

    switch (id) {
      case 0:
        final response = ResponsePacket();
        response.decode(data);
        return response;
      default:
        throw Exception('Unexpected packet with ID ${id}');
    }
  }

  _writePacket(Packet packet) {
    Uint8List data = packet.encode();
    int dataLen = data.length;

    RawWriter packetWriter = RawWriter.withCapacity(1024);
    packetWriter.writeVarUint(dataLen + 1);
    packetWriter.writeVarUint(packet.id);
    packetWriter.writeBytes(data);

    int bytesLen = packetWriter.length;
    Uint8List bytes = packetWriter.toUint8ListView().sublist(0, bytesLen);

    print('writing ${bytes}');
    _socket.add(bytes);
  }

  handshake() async {
    final handshake = HandshakePacket(4, _host, _port, 1);
    _writePacket(handshake);
  }

  Future<StatusResponse> request() async {
    final request = RequestPacket();
    _writePacket(request);

    // await Future.delayed(Duration(seconds: 3));
    final response = await _readPacket();
    print(response);

    return StatusResponse(null, null, null, null, null); // TODO
  }

  close() async {
    _socket.close();
  }
}
