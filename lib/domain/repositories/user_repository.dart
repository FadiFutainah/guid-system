import 'package:app/data/services/auth_service.dart';
import 'package:app/data/services/local_storage.dart';
import 'package:app/domain/entities/response_model.dart';

class UserRepository {
  final AuthService _authService = AuthService();

  Future<bool> hasValidToken() async {
    String token = await LocalStorage().token;
    if (token == '') {
      return false;
    } else {
      return _authService.validateToken(token);
    }
  }

  Future<ResponseModel> login(String username, String password) async {
    try {
      String data = await _authService.login(username, password);
      return ResponseModel(data, false);
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
