import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/models/account_model.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/requests/account_request.dart';
import 'package:uncover/logic/requests/users_request.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/shared_prefs_service.dart';

class UsersProvider extends ChangeNotifier {

  AccountModel? _users;
  String? _errorMessage;

  Future<void> getUsersFromServer (AccountModel account) async {
    UsersRequest request = UsersRequest();
    request.getUsers(account.authToken, _setUsersFromHttp);
  }

  void _setUsersFromHttp(http.Response response) {
    // UserModel user = UserModel.fromJson(jsonDecode(response.body)["user"]);
    users = jsonDecode(response.body)["authToken"];
  }

  set users(users) {
    _users = users;
    notifyListeners();
  }

  get users => _users;
}