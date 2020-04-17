import 'dart:typed_data';

import 'package:dart_mc_ping/packet/packet.dart';
import 'package:fixnum/fixnum.dart';
import 'package:raw/raw.dart';

class PongPacket extends Packet {
  Int64 now;

  PongPacket() : super(1);

  @override
  Uint8List encode() {
    throw Exception('Not implemented');
  }

  @override
  void decode(Uint8List data) {
    RawReader reader = RawReader.withBytes(data);
    now = reader.readFixInt64(Endian.little);
  }

  @override
  String toString() {
    return 'PongPacket{now: $now}';
  }
}
