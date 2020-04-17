/// Minecraft chat colors (see https://wiki.vg/Chat#Colors)
enum ChatColor {
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
}

Map<String, ChatColor> _colorMap = Map.fromIterable(
  ChatColor.values,
  key: (c) => c.toString().split('.').last,
  value: (c) => c,
);

/// Parse the string into a ChatColor
ChatColor parseColor(String string) {
  return _colorMap[string];
}
