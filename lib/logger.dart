import 'package:logging/logging.dart';

final Logger logger = Logger.detached("MC_PING");

void configureLogger({Level level = Level.OFF}) {
  logger.level = level;
  logger.onRecord.listen((record) {
    final level = '${record.level.name.padRight(5)}';
    print('[$level] ${record.time} | ${record.message}');
  });
}
