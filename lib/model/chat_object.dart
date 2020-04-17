import 'package:dart_mc_ping/model/chat_color.dart';

class ChatObject {
  final bool bold;
  final bool italic;
  final bool underlined;
  final bool strikethrough;
  final bool obfuscated;
  final ChatColor color;
  final String text;
  final List<ChatObject> extra;

  ChatObject.fromJson(Map<String, dynamic> json)
      : this.bold = json['bold'] ?? false,
        this.italic = json['italic'] ?? false,
        this.underlined = json['underlined'] ?? false,
        this.strikethrough = json['strikethrough'] ?? false,
        this.obfuscated = json['obfuscated'] ?? false,
        this.color = parseColor(json['color']) ?? ChatColor.white,
        this.text = json['text'],
        this.extra = (json['extra'] as List ?? [])
            .map((e) => ChatObject.fromJson(e))
            .toList(growable: false);

  @override
  String toString() {
    return 'ChatObject{bold: $bold, italic: $italic, underlined: $underlined, strikethrough: $strikethrough, obfuscated: $obfuscated, color: $color, text: $text, extra: $extra}';
  }
}
