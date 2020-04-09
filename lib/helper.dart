

import 'dart:typed_data';

int readVarInt(ByteData data) {
  int i = 0;
  int offset = 0;
  
  while (true) {
    int byte =  data.getUint8(offset);
    i |= (byte & 0x7F) << offset++ * 7;
    
    if (offset > 5)
      throw new Exception("VarInt too big");
    
    if ((byte & 0x80) != 128)
      break;
  }
  
  return i;
}

