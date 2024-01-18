import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final String _id = 'id';
  final String _firstName = 'firstName';
  final String _lastName = 'lastName';
  final String _firebaseToken = 'firebaseToken';

  final Future<SharedPreferences> _sharedPrefs = SharedPreferences.getInstance();

  Future<void> setFirebaseToken(String firebaseToken) async {
    final sharedPrefs = await _sharedPrefs;
    sharedPrefs.setString(_firebaseToken, firebaseToken);
  }

  Future<String?> getFirebaseToken() async {
    final sharedPrefs = await _sharedPrefs;
    return sharedPrefs.getString(_firebaseToken);
  }
}