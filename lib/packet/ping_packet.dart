import 'dart:typed_data';

import 'package:dart_mc_ping/packet/packet.dart';
import 'package:fixnum/fixnum.dart';
import 'package:raw/raw.dart';

class PingPacket extends Packet {
  Int64 now;

  PingPacket(this.now) : super(1);

  @override
  Uint8List encode() {
    RawWriter writer = RawWriter.withCapacity(64);
    writer.writeFixInt64(now);
    return writer.toUint8ListView().sublist(0, writer.length);
  }

  @override
  void decode(Uint8List data) {
    throw Exception('Not implemented');
  }

  @override
  String toString() {
    return 'PingPacket{now: $now}';
  }
}
