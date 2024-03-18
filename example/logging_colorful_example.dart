import 'package:logging_colorful/logging_colorful.dart';

void main() {
  // Define your Logger configuration
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.loggerName} - ${record.level.name}: ${record.message}');
  });

// Initialize a LoggerColorful that will make your logger colorized
  final log = LoggerColorful('MyLogger');
  log.shout('shout');
  log.severe('severe');
  log.warning('warning');
  log.info('info');
  log.config('config');
  log.fine('fine');
  log.finer('finer');
  log.finest('finest');

  // Change the Color for a Level
  // (In this case we assign an AnsiColor to [Level.FINEST] which has no AnsiColor to remove the rainbow)
  log.colorLevel[Level.FINEST] = AnsiColor.backgroundGreen;
  log.finest('finest with color instead of rainbow');

  // You can disable colors
  // May be useful for iOS users, since iOS doesn't render ANSI Colors (escaped)
  log.disabledColors = true;
  log.finest('colors are disabled');
}
