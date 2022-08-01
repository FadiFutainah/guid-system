import 'package:app/data/helpers/restapi_service.dart';
import 'package:app/data/services/local_storage.dart';

class AuthService {
  final RestApiService _restApi = RestApiService('http://127.0.0.1:8088/');

  Future<bool> validateToken(String token) async {
    try {
      var response = await _restApi.post(
        'auth/jwt/verify',
        {'username': token},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> login(String username, String password) async {
    try {
      var response = await _restApi.post(
        'auth/jwt/create',
        {'username': username, 'password': password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    await LocalStorage().deleteToken();
    bool deleted = await LocalStorage().token == '';
    return deleted;
  }
}
