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

extension _ChatColorExtension on ChatColor {
  String get name {
    return this.toString().split('.').last;
  }
}

Map<String, ChatColor> colorMap = Map.fromIterable(
  ChatColor.values,
  key: (c) => (c as ChatColor).name,
  value: (c) => c,
);

ChatColor parseColor(String string) {
  return colorMap[string];
}
