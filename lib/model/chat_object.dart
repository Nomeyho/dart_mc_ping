import 'package:colorize/colorize.dart';
import 'package:dart_mc_ping/model/chat_color.dart';
import 'package:dart_mc_ping/model/chat_formatter.dart';

/// Minecraft ChatObject. The server MOTD is returned in this format.
class ChatObject {
  bool bold;
  bool italic;
  bool underlined;
  bool strikethrough;
  bool obfuscated;
  ChatColor color;
  String text;

  /// The nested ChatObjects.
  /// The parent style are automatically applied to all children (recursively),
  /// unless explicitly overridden in the child object.
  final List<ChatObject> extra;

  ChatObject()
      : text = '',
        extra = [];

  ChatObject.fromString(String text)
      : this.bold = false,
        this.italic = false,
        this.underlined = false,
        this.strikethrough = false,
        this.obfuscated = false,
        this.color = null,
        this.text = text,
        this.extra = [];

  ChatObject.fromJson(Map<String, dynamic> json)
      : this.bold = json['bold'],
        this.italic = json['italic'],
        this.underlined = json['underlined'],
        this.strikethrough = json['strikethrough'],
        this.obfuscated = json['obfuscated'],
        this.color = ChatColor.getColorByName(json['color']),
        this.text = json['text'],
        this.extra = (json['extra'] as List ?? [])
            .map((e) => ChatObject.fromJson(e))
            .toList(growable: false);

  void setColor(ChatColor chatColor) {
    this.color = chatColor;
    this
        .extra
        .where((extra) => extra.color == null)

        /// children can override style
        .forEach((extra) => extra.setColor(chatColor));
  }

  void setObfuscated() {
    this.obfuscated = true;
    this
        .extra
        .where((extra) => extra.obfuscated == null)
        .forEach((extra) => extra.setObfuscated());
  }

  void setBold() {
    this.bold = true;
    this
        .extra
        .where((extra) => extra.bold == null)
        .forEach((extra) => extra.setBold());
  }

  void setStrikethrough() {
    this.strikethrough = true;
    this
        .extra
        .where((extra) => extra.strikethrough == null)
        .forEach((extra) => extra.setStrikethrough());
  }

  void setUnderlined() {
    this.underlined = true;
    this
        .extra
        .where((extra) => extra.underlined == null)
        .forEach((extra) => extra.setUnderlined());
  }

  void setItalic() {
    this.italic = true;
    this
        .extra
        .where((extra) => extra.italic == null)
        .forEach((extra) => extra.setUnderlined());
  }

  void reset() {
    this.color = null;
    this.bold = null;
    this.italic = null;
    this.underlined = null;
    this.strikethrough = null;
    this.obfuscated = null;
    this.bold = null;
  }

  /// Used to remove color code and format code from the text and use
  /// the dedicated fields of the ChatObject: bold, italic etc.
  ChatObject normalize() {
    final ChatObject rootMessage = ChatObject()
      ..color = color
      ..bold = bold
      ..italic = italic
      ..underlined = underlined
      ..strikethrough = strikethrough
      ..obfuscated = obfuscated
      ..bold = bold;
    ChatObject normalizedMessage = rootMessage;
    int i = 0;

    /// bottom-up
    this
        .extra
        .map((extra) => extra.normalize())
        .forEach((extra) => normalizedMessage.extra.add(extra));

    while (i < text.length - 1) {
      final String code = text.substring(i, i + 2);

      if (ChatColor.isColor(code)) {
        final ChatColor color = ChatColor.getColorByCode(code);

        if (normalizedMessage.color == null) {
          normalizedMessage.setColor(color);
        } else {
          normalizedMessage = _wrapMessage(normalizedMessage);
          normalizedMessage.setColor(color);
        }

        i += 2;
      } else if (ChatFormatter.isFormatter(code)) {
        final ChatFormatter formatter = ChatFormatter.getFormatByCode(code);

        if (formatter == ChatFormatter.italic) {
          if (normalizedMessage.italic != null) {
            normalizedMessage = _wrapMessage(normalizedMessage);
          }
          normalizedMessage.setItalic();
        } else if (formatter == ChatFormatter.bold) {
          if (normalizedMessage.bold != null) {
            normalizedMessage = _wrapMessage(normalizedMessage);
          }
          normalizedMessage.setBold();
        } else if (formatter == ChatFormatter.obfuscated) {
          if (normalizedMessage.obfuscated != null) {
            normalizedMessage = _wrapMessage(normalizedMessage);
          }
          normalizedMessage.setObfuscated();
        } else if (formatter == ChatFormatter.strikethrough) {
          if (normalizedMessage.strikethrough != null) {
            normalizedMessage = _wrapMessage(normalizedMessage);
          }
          normalizedMessage.setStrikethrough();
        } else if (formatter == ChatFormatter.reset) {
          _wrapMessage(normalizedMessage); // always
          normalizedMessage.reset();
        } else if (formatter == ChatFormatter.underline) {
          if (normalizedMessage.underlined != null) {
            normalizedMessage = _wrapMessage(normalizedMessage);
          }
          normalizedMessage.setUnderlined();
        }

        i += 2;
      } else {
        normalizedMessage.text += this.text[i];
        i += 1;
      }
    }

    /// last character is not added unless it is a color/formatter
    if (i < text.length) {
      normalizedMessage.text += text.substring(i);
    }

    return rootMessage;
  }

  _wrapMessage(ChatObject parent) {
    /// append new child and transfer children
    ChatObject child = ChatObject();
    child.extra.addAll(parent.extra);
    child.setColor(color);
    parent.extra.clear();
    parent.extra.add(child);
    return child;
  }

  @override
  String toString() {
    return 'ChatObject{bold: $bold, italic: $italic, underlined: $underlined, strikethrough: $strikethrough, obfuscated: $obfuscated, color: $color, text: $text, extra: $extra}';
  }

  /// Return an ANSI formatted/colored string of the server's MOTD.
  String toColoredString() {
    final Colorize colorize = Colorize(text);

    if (color == null) {
      colorize.white();
    } else {
      color.colorize(colorize);
    }

    if (bold != null && bold) {
      colorize.bold();
    }

    if (italic != null && italic) {
      colorize.italic();
    }

    if (underlined != null && underlined) {
      colorize.underline();
    }

    if (strikethrough != null && strikethrough) {
      colorize.toString();
    }

    if (obfuscated != null && obfuscated) {
      colorize.blink();
    }

    return colorize.toString() +
        extra.map((extra) => extra.toColoredString()).join() +
        resetString;
  }

  final String resetString = (Colorize()..default_slyle()).toString();
}
