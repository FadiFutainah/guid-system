class AppException implements Exception {
  final String _message;

  AppException(this._message) : super();

  @override
  String toString() => _message;
}

class FetchDataException extends AppException {
  FetchDataException(int statusCode) : super('');
}

class InternetConnectionException extends AppException {
  InternetConnectionException() : super('No Internet connection');
}

class WeakInternetConnection extends AppException {
  WeakInternetConnection() : super('Weak internet connection');
}

class NotFoundException extends AppException {
  NotFoundException(int statusCode) : super('Not found');
}
