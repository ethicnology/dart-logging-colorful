import 'package:logging_colorful/logging_colorful.dart';

void main() {
  // Define your Logger configuration
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.loggerName} - ${record.level.name}: ${record.message}');
  });

  // Initialize a Logger
  var log = Logger('MyLogger');
  log.info('parent logger is not colorized');

// Initialize a LoggerColorful that will make your logger colorized
  final colorLog = LoggerColorful(log);
  colorLog.shout('shout');
  colorLog.severe('severe');
  colorLog.warning('warning');
  colorLog.info('info');
  colorLog.config('config');
  colorLog.fine('fine');
  colorLog.finer('finer');
  colorLog.finest('finest');

  // Change the Color for a Level
  // (In this case we assign an AnsiColor to [Level.FINEST] which has no AnsiColor to remove the rainbow)
  colorLog.colorLevel[Level.FINEST] = AnsiColor.backgroundGreen;
  colorLog.finest('finest with color instead of rainbow');
}
