library dart_mc_ping;

import 'package:dart_mc_ping/protocol/mc_client.dart';

import 'models/Player.dart';

Future<StatusResponse> ping(final Uri uri, { debug = false }) async {
  final client = McClient(uri);

  await client.connect();
  _debug('Connected to $uri', debug);

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
