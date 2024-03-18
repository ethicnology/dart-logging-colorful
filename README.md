[![License: LGPL v3](https://img.shields.io/badge/License-LGPL_v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)
[![pub package](https://img.shields.io/pub/v/logging_colorful.svg)](https://pub.dartlang.org/packages/logging_colorful)
# logging_colorful


I'm using the [logging](https://pub.dev/packages/logging) package and i wanted it to be colorful.
When I searched for this, I found packages with way too much features and dependencies.

So I created this package with no other dependencies than the necessary [logging](https://pub.dev/packages/logging).

If you don't want to import this package, you can take the two files in `lib/src`.

## Features
- Colorful logging
- Change color for each Level

## Limitations
- [iOS do not display ANSI colors (escaped)](https://github.com/flutter/flutter/issues/64491)
```dart
log.disabledColors = Platform.isIOS;
```

## Usage

```dart
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
```
## Screenshots
![1.0.0](https://github.com/ethicnology/dart-logging-colorful/blob/main/screenshot.png)

## Additional information

All the available colors are listed in `lib/src/color.dart` file. 

