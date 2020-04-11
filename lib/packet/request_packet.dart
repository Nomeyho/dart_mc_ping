
import 'dart:typed_data';

import 'package:dart_mc_ping/packet/packet.dart';
import 'package:raw/raw.dart';

class RequestPacket extends Packet {

  RequestPacket() : super(0);

  @override
  void encodeData(RawWriter writer) {
    writer.writeVarUint(id);
  }

  @override
  void decodeData(RawReader reader) {
    throw Exception('Not implemented');
  }
}