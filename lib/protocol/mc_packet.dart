import 'dart:typed_data';

class McPacket {
  final int _id;
  ByteData _payload = ByteData(1024);
  int _offset = 0;

  McPacket(this._id);

  writeVarInt(int value) {
    while (true) {
      if ((value & 0xFFFFFF80) == 0) {
        _payload.setUint8(_offset, value);
        _offset++;
      }

      _payload.setUint8(_offset, value & 0x7F | 0x80);
      _offset++;
      value >>= 7; // TODO
    }
  }

  writeShort(int value) {
    _payload.setUint8(_offset, value);
    _offset++;
  }

  writeString(String value) {
    final len = value.length;
    writeVarInt(len);

    value.codeUnits.forEach((c) => writeShort(c));
  }

  pack() {
    final len =

    final bytes = ByteData(_offset + )

    final message = Uint8List.fromList(bytes);
    final bytes = ByteData.view(message.buffer);
  }
}

/*
class McPacket {
  final int _id;
  ByteData _payload = ByteData(1024);
  int _offset = 0;

  McPacket(this._id);

  writeVarInt(int value) {
    while (true) {
      if ((value & 0xFFFFFF80) == 0) {
        _payload.setUint8(_offset, value);
        _offset++;
      }

      _payload.setUint8(_offset, value & 0x7F | 0x80);
      _offset++;
      value >>= 7; // TODO
    }
  }

  writeShort(int value) {
    _payload.setUint8(_offset, value);
    _offset++;
  }

  writeString(String value) {
    final len = value.length;
    writeVarInt(len);

    value.codeUnits.forEach((c) => writeShort(c));
  }

  pack() {
    final len =

    final bytes = ByteData(_offset + )

    final message = Uint8List.fromList(bytes);
    final bytes = ByteData.view(message.buffer);
  }
}
*/

/*
int _readVarInt(ByteData data) {
  int i = 0;
  int offset = 0;

  while (true) {
    int byte = data.getUint8(offset);
    i |= (byte & 0x7F) << offset++ * 7;

    if (offset > 5) throw new Exception("VarInt too big");

    if ((byte & 0x80) != 128) break;
  }

  return i;
}

int _writeVarInt(ByteData data, int value) {
  int offset = 0;

  while (true) {
    if ((value & 0xFFFFFF80) == 0) {
      data.setUint8(offset, value);
      return offset++;
    }

    data.setUint8(offset, value & 0x7F | 0x80);
    offset++;
    value >>= 7; // TODO
  }
}
*/
