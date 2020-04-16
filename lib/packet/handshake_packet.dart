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
  Uint8List encode() {
    RawWriter writer = RawWriter.withCapacity(1024);

// TODO    writer.writeVarUint(id);
    writer.writeVarUint(protocolVersion);
    writer.writeVarUint(hostname.length);
    writer.writeUtf8(hostname);
    writer.writeUint16(port);
    writer.writeVarUint(state);

    return writer.toUint8ListView().sublist(0, writer.length);
  }

  @override
  void decode(Uint8List data) {
    throw Exception('Not implemented');
  }
}
