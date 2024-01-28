import 'package:flutter/cupertino.dart';
import 'package:uncover/logic/models/account_model.dart';
import 'package:uncover/logic/requests/account_request.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/shared_prefs_service.dart';

class AccountProvider extends ChangeNotifier {

  AccountModel? _account;
  final SharedPrefs _sharedPrefs = SharedPrefs();
  String? _errorMessage;

  Future<bool> register (String? firstName, String? lastName, String? phone) async {
    AccountRequest request = AccountRequest();

    Map<String, dynamic> body = {
      constant.firstName: firstName ?? '',
      constant.lastName: lastName ?? '',
      constant.phone: phone ?? '',
      constant.deviceToken: await SharedPrefs().getFirebaseToken(),
    };
    return request.register(body, setAccountFromHttp);
  }

  void setAccountFromHttp(http.Response response) {
    AccountModel currentUser = AccountModel.fromJson(jsonDecode(response.body)["user"]);
    currentUser.authToken = jsonDecode(response.body)["authToken"];
    account = currentUser;
  }

  Future<bool> updateProfile () async {
    AccountRequest request = AccountRequest();

    Map<String, dynamic> body = {
      constant.lastLocation: _account?.lastLocation ?? '',
      constant.interests: _account?.interests ?? '',
    };
    return request.updateUserProfile(body, _account);
  }

  void setAccountFromSharedPrefs() async {
    _account = await SharedPrefs().getAccount();
    notifyListeners();
  }

  set account(account) {
    _account = account;
    notifyListeners();
    SharedPrefs().setAccount(account);
  }

  get account => _account;

  set fcmToken(token) {
    _account?.firebaseToken = token ?? 'fcm token is not defined';
    notifyListeners();
  }

  get fcmToken => _account?.firebaseToken ?? 'fcm token is empty';

  set lastLocation(location) {
    _account?.lastLocation = location;
    notifyListeners();
  }

  get lastLocation => _account?.lastLocation;
}