import 'dart:typed_data';

import 'package:dart_mc_ping/packet/packet.dart';
import 'package:raw/raw.dart';

class ResponsePacket extends Packet {
  String json;

  ResponsePacket() : super(0);

  @override
  Uint8List encode() {
    throw Exception('Not implemented');
  }

  @override
  void decode(Uint8List data) {
    RawReader reader = RawReader.withBytes(data);

    /*
    int size = reader.readVarUint();
    print('size $size');
    int id = reader.readVarUint();
    print('id $id');
    */
    int len = reader.readVarUint();
    print('json length $len');

    final chars =
        reader.readUtf8(reader.availableLengthInBytes - reader.index - 1);
    print(chars);

    //json = reader.readUtf8(1452);
    // print(json);
    //String.fromCharCodes(charCodes)
  }
}
