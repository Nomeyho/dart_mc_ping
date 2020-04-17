import 'dart:typed_data';

import 'package:dart_mc_ping/packet/packet.dart';

class RequestPacket extends Packet {
  RequestPacket() : super(0);

  @override
  Uint8List encode() {
    return Uint8List(0);
  }

  @override
  void decode(Uint8List data) {
    throw Exception('Not implemented');
  }
}
