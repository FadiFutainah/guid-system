abstract class Rest {
  final String serverAddress;
  final Duration timeoutDuration = const Duration(seconds: 50);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': '*/*',
  };

  Rest(this.serverAddress);

  dynamic get(String endpoint);
  dynamic post(String endpoint, Map<String, dynamic> body);
  dynamic put(String endpoint);
  dynamic delete(String endpoint);
}
