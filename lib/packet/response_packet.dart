import 'dart:typed_data';

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:dart_mc_ping/packet/packet.dart';
import 'package:raw/raw.dart';

class ResponsePacket extends Packet {
  StatusResponse response;

  ResponsePacket() : super(0);

  @override
  Uint8List encode() {
    throw Exception('Not implemented');
  }

  @override
  void decode(Uint8List data) {
    RawReader reader = RawReader.withBytes(data);

    int len = reader.readVarUint();
    print('[ResponsePacket] JSON length $len');

    final chars = reader.readUtf8(len);
    print(chars);



  }
}
