import 'package:colorize/colorize.dart';

/// Minecraft color
class ChatColor {
  static final List<ChatColor> _colors = [
    black,
    dark_blue,
    dark_green,
    dark_aqua,
    dark_red,
    dark_purple,
    gold,
    gray,
    dark_gray,
    blue,
    green,
    aqua,
    red,
    light_purple,
    yellow,
    white,
  ];
  static final Map<String, ChatColor> _codeToColor =
      Map.fromIterable(_colors, key: (c) => c.code, value: (c) => c);

  static final Map<String, ChatColor> _nameToColor =
      Map.fromIterable(_colors, key: (c) => c.name, value: (c) => c);

  /// Minecraft color code (§0 -> §f)
  final String code;

  /// Minecraft color name
  final String name;

  /// Hexadecimal color value
  final int hex;

  ChatColor(this.code, this.name, this.hex);

  /// Check if the provided 2-char code corresponds to a Minecraft color
  static isColor(String code) {
    return _codeToColor.containsKey(code);
  }

  /// Return the color corresponding to the provided 2-char code
  static ChatColor getColorByCode(String code) {
    return _codeToColor[code];
  }

  /// Return the color corresponding to the provided name
  static ChatColor getColorByName(String name) {
    return _nameToColor[name];
  }

  @override
  String toString() {
    return name;
  }

  /// Apply the ANSI color corresponding to this instance to the colorize object
  void colorize(Colorize colorize) {
    if (this == black) {
      colorize.black();
    } else if (this == dark_blue) {
      colorize.blue();
    } else if (this == dark_green) {
      colorize.green();
    } else if (this == dark_aqua) {
      colorize.cyan();
    } else if (this == dark_red) {
      colorize.red();
    } else if (this == dark_purple) {
      colorize.magenta();
    } else if (this == gold) {
      colorize.yellow();
    } else if (this == gray) {
      colorize.lightGray();
    } else if (this == dark_gray) {
      colorize.darkGray();
    } else if (this == blue) {
      colorize.lightBlue();
    } else if (this == green) {
      colorize.lightGreen();
    } else if (this == aqua) {
      colorize.lightCyan();
    } else if (this == red) {
      colorize.lightRed();
    } else if (this == light_purple) {
      colorize.lightMagenta();
    } else if (this == yellow) {
      colorize.lightYellow();
    } else if (this == white) {
      colorize.white();
    }
  }

  static final black = ChatColor('§0', 'black', 0xff000000);
  static final dark_blue = ChatColor('§1', 'dark_blue', 0xff0000AA);
  static final dark_green = ChatColor('§2', 'dark_green', 0xff00AA00);
  static final dark_aqua = ChatColor('§3', 'dark_aqua', 0xff00AAAA);
  static final dark_red = ChatColor('§4', 'dark_red', 0xffAA0000);
  static final dark_purple = ChatColor('§5', 'dark_purple', 0xffAA00AA);
  static final gold = ChatColor('§6', 'gold', 0xffFFAA00);
  static final gray = ChatColor('§7', 'gray', 0xffAAAAAA);
  static final dark_gray = ChatColor('§8', 'dark_gray', 0xff555555);
  static final blue = ChatColor('§9', 'blue', 0xff5555FF);
  static final green = ChatColor('§a', 'green', 0xff55FF55);
  static final aqua = ChatColor('§b', 'aqua', 0xff55FFFF);
  static final red = ChatColor('§c', 'red', 0xffFF5555);
  static final light_purple = ChatColor('§d', 'light_purple', 0xffFF55FF);
  static final yellow = ChatColor('§e', 'yellow', 0xffFFFF55);
  static final white = ChatColor('§f', 'white', 0xffFFFFFF);
}
