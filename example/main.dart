import 'package:dart_mc_ping/dart_mc_ping.dart';

void main() async {
  final statusResponse = await ping('play.hivemc.com');
  print('${statusResponse.ms} ms'); // 28ms
}
