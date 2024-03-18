import 'dart:async';

import 'package:logging/logging.dart';
import 'package:logging_colorful/src/color.dart';

/// This class provide colorful feature to your logging
class LoggerColorful {
  /// Disable colors
  ///
  /// iOS does not output ANSI colors (they're escaped)
  /// You should avoid colorization to not spoil your logging on this platform
  /// https://github.com/flutter/flutter/issues/64491
  bool disabledColors = false;

  /// Define the Colors associated for each level
  /// You can override according to your preferences
  ///
  /// By default [FINEST] has no color assigned,
  /// it means that it will be displayed using rainbow colors.
  /// Assign a color to [Level.FINEST] in [LoggerColorful.colorLevel] to remove the rainbow
  Map<Level, AnsiColor> colorLevel = {
    Level.SHOUT: AnsiColor.highIntensityBackgroundRed,
    Level.SEVERE: AnsiColor.boldRed,
    Level.WARNING: AnsiColor.boldYellow,
    Level.INFO: AnsiColor.blue,
    Level.CONFIG: AnsiColor.purple,
    Level.FINE: AnsiColor.green,
    Level.FINER: AnsiColor.boldGreen,
    // Level.FINEST: AnsiColor.highIntensityBackgroundGreen,
  };

  /// Provide a [Logger] attribute because we can't extend the Logger class
  /// as it only has factory constructor and a generative constructor is needed
  late Logger logger;

  /// Constructor
  LoggerColorful(String name) {
    logger = Logger(name);
  }

  /// Log message at level [Level.SHOUT].
  void shout(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.SHOUT;
    var color = colorLevel[level]!;
    message = _colorize(message.toString(), color);
    log(level, message, error, stackTrace);
  }

  /// Log message at level [Level.SEVERE].
  void severe(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.SEVERE;
    var color = colorLevel[level]!;
    message = _colorize(message.toString(), color);
    log(level, message, error, stackTrace);
  }

  /// Log message at level [Level.WARNING].
  void warning(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.WARNING;
    var color = colorLevel[level]!;
    message = _colorize(message.toString(), color);
    log(level, message, error, stackTrace);
  }

  /// Log message at level [Level.INFO].
  void info(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.INFO;
    var color = colorLevel[level]!;
    message = _colorize(message.toString(), color);
    log(level, message, error, stackTrace);
  }

  /// Log message at level [Level.CONFIG].
  void config(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.CONFIG;
    var color = colorLevel[level]!;
    message = _colorize(message.toString(), color);
    log(level, message, error, stackTrace);
  }

  /// Log message at level [Level.FINE].
  void fine(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.FINE;
    var color = colorLevel[level]!;
    message = _colorize(message.toString(), color);
    log(level, message, error, stackTrace);
  }

  /// Log message at level [Level.FINER].
  void finer(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.FINER;
    var color = colorLevel[level]!;
    message = _colorize(message.toString(), color);
    log(level, message, error, stackTrace);
  }

  /// Log message at level [Level.FINEST].
  ///
  /// By default [Level.FINEST] has no color assigned,
  /// it means that it will be displayed using rainbow colors.
  /// Assign a color to [Level.FINEST] in [LoggerColorful.colorLevel] to remove the rainbow.
  void finest(Object? message, [Object? error, StackTrace? stackTrace]) {
    var level = Level.FINEST;
    if (colorLevel.containsKey(Level.FINEST)) {
      message = _colorize(message.toString(), colorLevel[level]!);
    } else if (message is String) {
      message = _rainbow(message.toString());
    }
    log(level, message, error, stackTrace);
  }

  /// Log message at any [Level].
  ///
  /// If [message] is a [String] colorize it.
  ///
  /// If no apply the parent [Logger.log] function.
  void log(Level logLevel, Object? message,
      [Object? error, StackTrace? stackTrace, Zone? zone]) {
    logger.log(logLevel, message, [error, stackTrace, zone]);
  }

  /// Return a [String] colored according the [AnsiColor]
  String _colorize(String message, AnsiColor color) {
    if (disabledColors) return message;
    return '$color$message${AnsiColor.reset}';
  }

  /// Return a [String] colored with a rainbow of [AnsiColor]
  String _rainbow(String text) {
    final rainbow = [
      AnsiColor.boldRed,
      AnsiColor.boldGreen,
      AnsiColor.boldYellow,
      AnsiColor.boldBlue,
      AnsiColor.boldPurple,
      AnsiColor.boldCyan,
      AnsiColor.boldWhite
    ];
    final rainbowText = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      final char = text[i];
      final color = rainbow[i % rainbow.length];
      rainbowText.write('$color$char');
    }
    rainbowText.write(AnsiColor.reset);
    return rainbowText.toString();
  }
}
