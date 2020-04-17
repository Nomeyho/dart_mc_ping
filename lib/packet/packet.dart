import 'dart:typed_data';

abstract class Packet {
  int id;

  Packet(this.id);

  Uint8List encode();

  void decode(Uint8List data);
}
