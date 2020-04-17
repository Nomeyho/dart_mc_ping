# dart_mc_ping

> A Dart implementation of the Minecraft ping protocol

## Usage
``
import 'package:dart_mc_ping/dart_mc_ping.dart';

final statusResponse = await ping('play.hivemc.com');
print('${statusResponse.ms} ms'); // 28ms
```

## Note
The text formatters (color, bold, italic etc.) of the server's MOTD
are sometimes returned inside the text instead of using the dedicated fields of the `ChatObject`.

Example:
```
{ "text": "§3§l >> MyMOTD <<" }
```
instead of
```
{ "text": ">> MyMOTD <<", "color": "dark_aqua", "bold": true }
```
