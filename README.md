# Dart Minecraft ping
A Dart implementation of the [Minecraft ping protocol](https://wiki.vg/Server_List_Ping)

[https://pub.dev/packages/dart_mc_ping](https://pub.dev/packages/dart_mc_ping)

## Usage
```
import 'package:dart_mc_ping/dart_mc_ping.dart';

final statusResponse = await ping('play.hivemc.com');
print('${statusResponse.ms} ms'); // 28ms
print(statusResponse.description.toColoredString()); // MOTD with ANSI colors and format
```
