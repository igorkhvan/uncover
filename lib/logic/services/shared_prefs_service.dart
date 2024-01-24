import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncover/logic/models/account_model.dart';

class SharedPrefs {
  final String _uuid = 'uuid';
  final String _firstName = 'firstName';
  final String _lastName = 'lastName';
  final String _firebaseToken = 'firebaseToken';
  final String _phone = 'phone';
  final String _authToken = 'authToken';
  final String _avatar = 'avatar';

  Future<void> setFirebaseToken(String? firebaseToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_firebaseToken, firebaseToken ?? 'No fcm token received');
  }

  Future<String?> getFirebaseToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_firebaseToken);
  }

  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authToken);
  }

  Future<void> setAccount(AccountModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uuid, user.uuid ?? '');
    await prefs.setString(_firstName, user.firstName ?? '');
    await prefs.setString(_lastName, user.lastName ?? '');
    // await prefs.setString(_firebaseToken, user.firebaseToken ?? '');
    await prefs.setString(_phone, user.phone ?? '');
    await prefs.setString(_authToken, user.authToken ?? '');
    await prefs.setString(_avatar, user.avatar ?? '');
  }

  Future<AccountModel> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return AccountModel(
      uuid: prefs.getString(_uuid),
      firstName: prefs.getString(_firstName),
      lastName: prefs.getString(_lastName),
      // firebaseToken: prefs.getString(_firebaseToken),
      phone: prefs.getString(_phone),
      authToken: prefs.getString(_authToken),
      avatar: prefs.getString(_avatar),
    );
  }

  Future<void> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
