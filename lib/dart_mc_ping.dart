library dart_mc_ping;

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:dart_mc_ping/protocol/mc_client.dart';

void main() async {
  await ping("mc.hypixel.net");
}

Future<StatusResponse> ping(String host, { int port = 25565, debug = true }) async {

  final client = McClient(host, port);

  await client.connect();
  _debug('Connected to $host:$port', debug);

  await client.handshake();
  _debug('Handshake performed', debug);

  final statusResponse = await client.request();
  _debug('Received response $statusResponse', debug);

  await client.close();
  _debug('Closed socket', debug);

  return statusResponse;
}

_debug(message, debug) {
  if(debug) {
    print(message);
  }
}
