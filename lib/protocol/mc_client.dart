
import 'dart:io';
import 'dart:typed_data';

import 'package:dart_mc_ping/models/Player.dart';

class McClient {

  final Uri _uri;
  Socket _socket;

  McClient(this._uri);

  connect() async {
    _socket = await Socket.connect(_uri.host, _uri.port);
  }

  handshake() async {
    final message = Uint8List(4);
    final bytes = ByteData.view(message.buffer);
  }

  Future<StatusResponse> request() async {

  }

  close() async {
    _socket.close();
  }

  /*
  TODO
  Future<int> ping() async {

  }
  */

}