import 'Player.dart';

class Players {
  final int max;
  final int online;
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
