import 'package:dart_mc_ping/model/Players.dart';
import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/version.dart';

class StatusResponse {
  final ChatObject description;
  final Players players;
  final Version version;
  final String favicon;

  StatusResponse.fromJson(Map<String, dynamic> json)
      : description = ChatObject.fromJson(json['description']),
        players = Players.fromJson(json['players']),
        version = Version.fromJson(json['version']),
        favicon = json['favicon'];

  @override
  String toString() {
    return 'StatusResponse{description: $description, players: $players, version: $version, favicon: $favicon}';
  }
}
