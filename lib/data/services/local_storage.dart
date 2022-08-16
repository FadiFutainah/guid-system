import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage();

  Future<String> get accessToken async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('accessToken') ?? '';
  }

  Future<String> get refreshToken async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('refreshToken') ?? '';
  }

  Future<void> setTokens(String access, String refresh) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('accessToken', access);
    sharedPreferences.setString('refreshToken', refresh);
  }

  Future<void> deleteTokens() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('accessToken');
    sharedPreferences.remove('refreshToken');
  }
}
