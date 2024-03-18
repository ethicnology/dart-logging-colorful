import 'dart:io';

import 'package:logging_colorful/logging_colorful.dart';

void main() {
  // Define your Logger configuration
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.loggerName} - ${record.level.name}: ${record.message}');
  });

  // Initialize a LoggerColorful that will make your logger colorized
  // You can disable colors
  // May be useful for iOS users, since iOS doesn't render ANSI Colors (escaped)
  final log = LoggerColorful('MyLogger', disabledColors: Platform.isIOS);
  log.shout('shout');
  log.severe('severe');
  log.warning('warning');
  log.info('info');
  log.config('config');
  log.fine('fine');
  log.finer('finer');
  log.finest('finest');

  // Change the Color for a Level
  log.colorLevel[Level.FINEST] = AnsiColor.rainbow;
  log.finest('finest with rainbow of color');
}
