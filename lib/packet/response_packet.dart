
import 'dart:typed_data';

import 'package:dart_mc_ping/packet/packet.dart';
import 'package:raw/raw.dart';

class ResponsePacket extends Packet {

  String json;

  ResponsePacket() : super(0);

  @override
  void encodeData(RawWriter writer) {
    throw Exception('Not implemented');
  }

  @override
  void decodeData(RawReader reader) {
    int id = reader.readVarUint();
    print('id $id');
    int len = reader.readVarUint();
    print('json length $len');
    json = reader.readUtf8(len);
  }
}