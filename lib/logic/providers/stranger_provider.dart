import 'package:flutter/cupertino.dart';
import 'package:uncover/logic/models/account_model.dart';
import 'package:uncover/logic/models/stranger_model.dart';
import 'package:uncover/logic/requests/stranger_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StrangerProvider extends ChangeNotifier {

  List<StrangerModel>? _strangers;
  StrangerModel? _selectedStranger;
  String? _errorMessage;

  Future<bool> getStrangersFromServer (AccountModel account) async {
    StrangerRequest request = StrangerRequest();
    return request.getStrangers(account.authToken, _setStrangersFromServer);
  }

  void _setStrangersFromServer(http.Response response) {
    var resultArray = jsonDecode(response.body)["users"] as List;
    strangers = resultArray.map((strangerJson) => StrangerModel.fromJson(strangerJson)).toList();
  }

  set strangers(strangers) {
    _strangers = strangers;
    notifyListeners();
  }

  get strangers => _strangers;

  get count => _strangers != null ? _strangers?.length : 0;

  set stranger(stranger) {
    _selectedStranger = stranger;
    notifyListeners();
  }

  get stranger => _selectedStranger;
}