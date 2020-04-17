
import 'package:logging/logging.dart';

configureLogger({ Level level = Level.OFF }) {
  Logger.root.level = level;
  Logger.root.onRecord.listen((record) {
    final level = '${record.level.name.padRight(5)}';
    print('[$level] ${record.time} | ${record.message}');
  });
}