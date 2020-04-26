/// Minecraft chat formatter
class ChatFormatter {
  static final List<ChatFormatter> _formatters = [
    obfuscated,
    bold,
    strikethrough,
    underline,
    italic,
    reset
  ];
  static final Map<String, ChatFormatter> _nameToFormat =
      Map.fromIterable(_formatters, key: (f) => f.code, value: (f) => f);

  final String code;
  final String name;

  ChatFormatter(this.code, this.name);

  /// Check if the provided 2-char code corresponds to a Minecraft text formatter
  static isFormatter(String code) {
    return _nameToFormat.containsKey(code);
  }

  /// Return the formatter corresponding to the provided 2-char code
  static ChatFormatter getFormatByCode(String code) {
    return _nameToFormat[code];
  }

  static final obfuscated = ChatFormatter('§k', 'obfuscated');
  static final bold = ChatFormatter('§l', 'bold');
  static final strikethrough = ChatFormatter('§m', 'strikethrough');
  static final underline = ChatFormatter('§n', 'underline');
  static final italic = ChatFormatter('§o', 'italic');
  static final reset = ChatFormatter('§r', 'reset');
}
