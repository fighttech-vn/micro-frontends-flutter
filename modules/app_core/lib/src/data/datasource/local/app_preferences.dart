import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPreferences {
  String? getToken();
  Future<void> saveToken(String token);

  static const keyToken = 'keyToken';
}

class AppPreferencesimpl extends AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferencesimpl(this.sharedPreferences);

  @override
  String? getToken() {
    return sharedPreferences.getString(AppPreferences.keyToken);
  }

  @override
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString(AppPreferences.keyToken, token);
  }
}
