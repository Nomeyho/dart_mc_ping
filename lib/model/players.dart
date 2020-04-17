import 'Player.dart';

/// Minecraft Player list
class Players {
  /// Maximum number of players allowed on the server
  final int max;
  /// Number of players online
  final int online;
  /// A subset of the online players. Some servers don't returned this field.
  final List<Player> sample;

  Players.fromJson(Map<String, dynamic> json)
      : this.max = json['max'] ?? 0,
        this.online = json['online'] ?? 0,
        this.sample = (json['sample'] as List ?? [])
            .map((s) => Player.fromJson(s))
            .toList(growable: false);

  @override
  String toString() {
    return 'Players{max: $max, online: $online, sample: $sample}';
  }
}
