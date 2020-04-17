library dart_mc_ping;

import 'package:dart_mc_ping/dart_mc_client.dart';
import 'package:dart_mc_ping/model/status_response.dart';
import 'package:logging/logging.dart';

void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    final level = '${record.level.name.padRight(5)}';
    print('[$level] ${record.time} | ${record.message}');
  });

  await ping("hub.mcs.gg");
}

Future<StatusResponse> ping(String host, {int port = 25565}) async {
  final client = McClient(host, port);
  await client.connect();
  final statusResponse = await client.ping();
  await client.close();
  return statusResponse;
}
