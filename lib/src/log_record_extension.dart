import 'package:logging/logging.dart';

extension LogRecordExtension on LogRecord {
  ({String error, String trace}) stringifyErrorAndTrace() {
    String error = '';
    String trace = '';
    if (this.error is List && (this.error! as List).isNotEmpty) {
      final firstElement = (this.error! as List).first;
      if (firstElement != null) error = firstElement.toString();
      try {
        final secondElement = (this.error! as List).elementAt(1);
        if (secondElement != null) trace = secondElement.toString();
      } catch (_) {}
    }
    return (error: error, trace: trace);
  }
}
