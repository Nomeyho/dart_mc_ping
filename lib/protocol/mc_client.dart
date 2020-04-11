import 'dart:io';

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:dart_mc_ping/packet/handshake_packet.dart';
import 'package:dart_mc_ping/packet/request_packet.dart';
import 'package:dart_mc_ping/packet/response_packet.dart';

class McClient {
  final String _host;
  final int _port;
  Socket _socket;

  McClient(this._host, this._port);

  connect() async {
    _socket = await Socket.connect(_host, _port);
  }

  handshake() async {
    final handshake = HandshakePacket(4, _host, _port, 1);
    _socket.add(handshake.encode());
  }

  Future<StatusResponse> request() async {
    final request = RequestPacket();
    _socket.add(request.encode());

    final data = await _socket.first;
    final response = ResponsePacket();
    response.decode(data);

    return StatusResponse(null, null, null, null, null); // TODO
  }

  close() async {
    _socket.close();
  }
}
