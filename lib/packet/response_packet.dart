import 'dart:typed_data';

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:dart_mc_ping/packet/packet.dart';
import 'package:raw/raw.dart';
import 'dart:convert' show jsonDecode;

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

    final int len = reader.readVarUint();
    final chars = reader.readUtf8(len);
    final json = jsonDecode(chars);

    this.response = StatusResponse.fromJson(json);
  }

  @override
  String toString() {
    return 'ResponsePacket{response: ...}';
  }
}
