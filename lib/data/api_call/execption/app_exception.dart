// ignore_for_file: prefer_typing_uninitialized_variables, annotate_overrides

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server Error');
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No internet');
}

class RequestTimeout extends AppException {
  RequestTimeout([String? message]) : super(message, 'Request Timeout');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}
