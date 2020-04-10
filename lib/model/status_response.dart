import 'package:dart_mc_ping/models/Player.dart';

class StatusResponse {
  final String description;
  final Players players;
  final Version version;
  final String favicon;
  final int time;

  StatusResponse(
    this.description,
    this.players,
    this.version,
    this.favicon,
    this.time,
  );

  @override
  String toString() {
    return 'StatusResponse{description: $description, players: $players, version: $version, favicon: $favicon, time: $time}';
  }
}
