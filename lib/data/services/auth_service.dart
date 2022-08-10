import 'package:app/data/helpers/restapi_service.dart';
import 'package:app/data/services/local_storage.dart';

class AuthService {
  final RestApiService _restApi =
      RestApiService('http://127.0.0.1:8088/auth/jwt/');

  Future<bool> validateToken(String token) async {
    try {
      await _restApi.post('verify', {'username': token});
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      await _restApi.post(
        'create',
        {'username': username, 'password': password},
      );
      return true;
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
