import 'dart:typed_data';

import 'package:dart_mc_ping/packet/packet.dart';
import 'package:raw/raw.dart';

class HandshakePacket extends Packet {
  int protocolVersion;
  String hostname;
  int port;
  int state;

  HandshakePacket(
    this.protocolVersion,
    this.hostname,
    this.port,
    this.state,
  ) : super(0);

  @override
  void encodeData(RawWriter writer) {
    writer.writeVarUint(id);
    writer.writeVarUint(protocolVersion);
    writer.writeVarUint(hostname.length);
    writer.writeUtf8(hostname);
    writer.writeUint16(port);
    writer.writeVarUint(state);
  }

  @override
  void decodeData(RawReader reader) {
    throw Exception('Not implemented');
  }
}
