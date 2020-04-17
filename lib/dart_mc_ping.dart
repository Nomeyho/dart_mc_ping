library dart_mc_ping;

import 'package:dart_mc_ping/dart_mc_client.dart';
import 'package:dart_mc_ping/model/status_response.dart';
import 'package:logging/logging.dart';

/// Ping a Minecraft server and return the server status.
Future<StatusResponse> ping(String host, {int port = 25565}) async {
  final client = McClient(host, port);
  await client.connect();

  final statusResponse = await client.ping();
  Logger.root.info('$host:$port -> ${statusResponse.ms} ms');

  await client.close();
  return statusResponse;
}
