import 'package:flutter/cupertino.dart';
import 'package:uncover/logic/models/user_model.dart';
import 'package:uncover/logic/requests/account_request.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/shared_prefs_service.dart';

class UsersProvider extends ChangeNotifier {

  UserModel? _users;
  String? _errorMessage;

  Future<void> register (String? firstName, String? lastName, String? phone) async {
    AccountRequest request = AccountRequest();

    Map<String, dynamic> body = {
      constant.firstName: firstName ?? '',
      constant.lastName: lastName ?? '',
      constant.phone: phone ?? '',
      constant.deviceToken: '1234567890'
    };

    request.register(body, setUsersFromHttp);
  }

  void setUsersFromHttp(http.Response response) {
    // UserModel user = UserModel.fromJson(jsonDecode(response.body)["user"]);
    users = jsonDecode(response.body)["authToken"];
  }

  set users(users) {
    _users = users;
    notifyListeners();
  }

  get users => _users;
}