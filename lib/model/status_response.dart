import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/players.dart';
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
      : description = _parseDescription(json),
        players = Players.fromJson(json['players']),
        version = Version.fromJson(json['version']),
        favicon = _parseFavicon(json['favicon']);

  static ChatObject _parseDescription(Map<String, dynamic> json) {
    final ChatObject description = json['description'] is String
        ? ChatObject.fromString(json['description'])
        : ChatObject.fromJson(json['description']);
    return description.normalize();
  }

  static String _parseFavicon(String favicon) {
    return favicon?.replaceAll('\n', '');
  }

  @override
  String toString() {
    return 'StatusResponse{description: $description, players: $players, version: $version, favicon: ${favicon == null ? favicon.substring(0, 20) : null}, ms: $ms}';
  }
}
