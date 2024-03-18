/// List ANSI colors codes available
enum AnsiColor {
  rainbow('rainbow'),

  // Regular AnsiColors
  black('\x1B[0;30m'),
  red('\x1B[0;31m'),
  green('\x1B[0;32m'),
  yellow('\x1B[0;33m'),
  blue('\x1B[0;34m'),
  purple('\x1B[0;35m'),
  cyan('\x1B[0;36m'),
  white('\x1B[0;37m'),

  // Bold
  boldBlack('\x1B[1;30m'),
  boldRed('\x1B[1;31m'),
  boldGreen('\x1B[1;32m'),
  boldYellow('\x1B[1;33m'),
  boldBlue('\x1B[1;34m'),
  boldPurple('\x1B[1;35m'),
  boldCyan('\x1B[1;36m'),
  boldWhite('\x1B[1;37m'),

  // Underline
  underlineBlack('\x1B[4;30m'),
  underlineRed('\x1B[4;31m'),
  underlineGreen('\x1B[4;32m'),
  underlineYellow('\x1B[4;33m'),
  underlineBlue('\x1B[4;34m'),
  underlinePurple('\x1B[4;35m'),
  underlineCyan('\x1B[4;36m'),
  underlineWhite('\x1B[4;37m'),

  // Background
  backgroundBlack('\x1B[40m'),
  backgroundRed('\x1B[41m'),
  backgroundGreen('\x1B[42m'),
  backgroundYellow('\x1B[43m'),
  backgroundBlue('\x1B[44m'),
  backgroundPurple('\x1B[45m'),
  backgroundCyan('\x1B[46m'),
  backgroundWhite('\x1B[47m'),

  // High Intensity
  highIntensityBlack('\x1B[0;90m'),
  highIntensityRed('\x1B[0;91m'),
  highIntensityGreen('\x1B[0;92m'),
  highIntensityYellow('\x1B[0;93m'),
  highIntensityBlue('\x1B[0;94m'),
  highIntensityPurple('\x1B[0;95m'),
  highIntensityCyan('\x1B[0;96m'),
  highIntensityWhite('\x1B[0;97m'),

  // Bold High Intensity
  boldHighIntensityBlack('\x1B[1;90m'),
  boldHighIntensityRed('\x1B[1;91m'),
  boldHighIntensityGreen('\x1B[1;92m'),
  boldHighIntensityYellow('\x1B[1;93m'),
  boldHighIntensityBlue('\x1B[1;94m'),
  boldHighIntensityPurple('\x1B[1;95m'),
  boldHighIntensityCyan('\x1B[1;96m'),
  boldHighIntensityWhite('\x1B[1;97m'),

  // High Intensity Background
  highIntensityBackgroundBlack('\x1B[0;100m'),
  highIntensityBackgroundRed('\x1B[0;101m'),
  highIntensityBackgroundGreen('\x1B[0;102m'),
  highIntensityBackgroundYellow('\x1B[0;103m'),
  highIntensityBackgroundBlue('\x1B[0;104m'),
  highIntensityBackgroundPurple('\x1B[0;105m'),
  highIntensityBackgroundCyan('\x1B[0;106m'),
  highIntensityBackgroundWhite('\x1B[0;107m'),

  // Reset
  reset('\x1B[0m');

  /// A string representation of this object.
  @override
  String toString() => _ansiCode;

  /// ANSI code for a color
  final String _ansiCode;

  /// Generative constructor
  const AnsiColor(this._ansiCode);
}
