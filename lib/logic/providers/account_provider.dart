import 'package:flutter/cupertino.dart';
import 'package:uncover/logic/models/user_model.dart';
import 'package:uncover/logic/requests/account_request.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/shared_prefs_service.dart';

class AccountProvider extends ChangeNotifier {

  UserModel? _user;

  final SharedPrefs _sharedPrefs = SharedPrefs();

  Future<void> register (String? firstName, String? lastName, String? phone) async {
    late bool isSuccess;
    AccountRequest request = AccountRequest();

    Map<String, dynamic> body = {
      constant.firstName: firstName ?? '',
      constant.lastName: lastName ?? '',
      constant.phone: phone ?? '',
      constant.deviceToken: '1234567890'
    };

    request.register(body, setUserFromHttp);
  }

  void setUserFromHttp(http.Response response) {
    UserModel user = UserModel.fromJson(jsonDecode(response.body)["user"]);
    user.authToken = jsonDecode(response.body)["authToken"];
    setUser(user);
  }

  void setUserFromSharedPrefs() async {
    _user = await _sharedPrefs.getUser();
    notifyListeners();
  }

  void setUser(user) {
    _user = user;
    notifyListeners();
    _sharedPrefs.setUser(user);
  }
}