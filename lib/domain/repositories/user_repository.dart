import 'package:app/data/services/auth_service.dart';
import 'package:app/data/services/local_storage.dart';
import 'package:app/domain/models/response_model.dart';

class UserRepository {
  final AuthService _authService = AuthService();

  Future<bool> hasValidToken() async {
    String token = await LocalStorage().accessToken;
    if (token == '') {
      return false;
    } else {
      try {
        return await _authService.validateToken(token);
      } catch (e) {
        return false;
      }
    }
  }

  Future<ResponseModel> login(String username, String password) async {
    try {
      await _authService.login(username, password);
      return ResponseModel('logged in successfully', false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }

  Future<ResponseModel> logout() async {
    bool loggedout = await _authService.logout();
    if (!loggedout) {
      return ResponseModel('logged out failed', true);
    }
    return ResponseModel('logged out successfully', false);
  }
}
