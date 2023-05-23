import 'package:logger/logger.dart';

late Logger _logger;
Logger get logger => _logger;

class CommonLogger {
  CommonLogger._();

  static void configure() {
    _logger = Logger(
      printer: PrettyPrinter(),
    );
  }
}