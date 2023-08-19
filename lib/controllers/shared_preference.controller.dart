import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  setUser(String token) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString('token', token);
  }

  Future<bool> getUser(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final getToken = sharedPreferences.getString('token');
    if (getToken == token) {
      return true;
    } else {
      return false;
    }
  }

  deleteUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
