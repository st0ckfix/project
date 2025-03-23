import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  final SharedPreferences sharedPreference;
  SharedPreferenceService(this.sharedPreference);

  Future<void> saveToken(String key, String token) async {
    await sharedPreference.setString(key, token);
  }

  Future<String> getToken(String key) async {
    return sharedPreference.getString(key) ?? '';
  }
}
