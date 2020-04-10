import 'Player.dart';

class Players {
  final int max;
  final int online;
  final List<Player> sample;

  Players(
    this.max,
    this.online,
    this.sample,
  );

  @override
  String toString() {
    return 'Players{max: $max, online: $online, sample: $sample}';
  }
}
