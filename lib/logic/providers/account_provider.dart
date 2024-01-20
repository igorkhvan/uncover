import 'package:flutter/cupertino.dart';
import 'package:uncover/logic/models/user_model.dart';
import 'package:uncover/logic/requests/account_request.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/shared_prefs_service.dart';

class AccountProvider extends ChangeNotifier {

  UserModel? _user;
  // final SharedPrefs _sharedPrefs = SharedPrefs();
  String? _errorMessage;

  Future<void> register (String? firstName, String? lastName, String? phone) async {
    AccountRequest request = AccountRequest();

    Map<String, dynamic> body = {
      constant.firstName: firstName ?? '',
      constant.lastName: lastName ?? '',
      constant.phone: phone ?? '',
      constant.deviceToken: await SharedPrefs().getFirebaseToken(),
    };

    request.register(body, setUserFromHttp);
  }

  void setUserFromHttp(http.Response response) {
    UserModel currentUser = UserModel.fromJson(jsonDecode(response.body)["user"]);
    currentUser.authToken = jsonDecode(response.body)["authToken"];
    user = currentUser;
  }

  void setUserFromSharedPrefs() async {
    _user = await SharedPrefs().getUser();
    notifyListeners();
  }

  set user(user) {
    _user = user;
    notifyListeners();
    SharedPrefs().setUser(user);
  }

  get user => _user;

  set fcmToken(token) {
    _user?.firebaseToken = token ?? 'fcm token is not defined';
    notifyListeners();
  }

  get fcmToken => _user?.firebaseToken ?? 'fcm token is empty';
}