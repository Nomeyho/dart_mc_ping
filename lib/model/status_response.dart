import 'package:dart_mc_ping/model/Players.dart';
import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/version.dart';

/// Minecraft Server status
class StatusResponse {
  /// Server MOTD
  final ChatObject description;
  /// Player related information (online, max etc.)
  final Players players;
  /// Server version
  final Version version;
  /// Server icon, base64 encoded
  final String favicon;
  /// Server latency in milliseconds
  int ms; // added afterwards

  StatusResponse.fromJson(Map<String, dynamic> json)
      : description = json['description'] is String
            ? ChatObject.fromString(json['description'])
            : ChatObject.fromJson(json['description']),
        players = Players.fromJson(json['players']),
        version = Version.fromJson(json['version']),
        favicon = json['favicon'];

  @override
  String toString() {
    return 'StatusResponse{description: $description, players: $players, version: $version, favicon: $favicon, ms: $ms}';
  }
}
