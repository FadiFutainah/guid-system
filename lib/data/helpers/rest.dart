import 'package:app/data/services/local_storage.dart';

abstract class Rest {
  final String serverAddress;
  final Duration timeoutDuration = const Duration(seconds: 50);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  Future<Map<String, String>> addTokenHeader(
      [preheaders = defaultHeaders]) async {
    Map<String, String> headers = {};
    String token = await LocalStorage().accessToken;
    headers.addAll(preheaders);
    headers['Authorization'] = 'Bearer $token';

    return headers;
  }

  Rest(this.serverAddress);

  dynamic get(String endpoint);
  dynamic post(String endpoint, Map<String, dynamic> body);
  dynamic put(String endpoint);
  dynamic delete(String endpoint);
}
