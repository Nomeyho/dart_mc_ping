
import 'dart:typed_data';

import 'package:raw/raw.dart';

abstract class Packet {

  int id;

  Packet(this.id);

  void encodeData(RawWriter writer);

  void decodeData(RawReader reader);

  Uint8List encode() {
    RawWriter dataWriter = RawWriter.withCapacity(1024);
    encodeData(dataWriter);
    print(dataWriter.toUint8ListCopy().sublist(0, dataWriter.length));

    RawWriter packetWriter = RawWriter.withCapacity(1024);
    packetWriter.writeVarUint(dataWriter.length);
    packetWriter.writeByteData(dataWriter.bufferAsByteData, 0, dataWriter.length);
    return packetWriter.toUint8ListView().sublist(0, packetWriter.length);
  }

  decode(Uint8List data) {
    RawReader reader = RawReader.withBytes(data);
    print(data);
    int len = reader.readVarUint();
    print('len $len');
    decodeData(reader);
  }
}