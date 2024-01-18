import 'package:flutter/cupertino.dart';
import 'package:uncover/logic/requests/account_request.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;

class AccountProvider extends ChangeNotifier {
  Future<void> register (String? firstName, String? lastName, String? phone) async {
    late bool isSuccess;
    AccountRequest request = AccountRequest();

    Map<String, dynamic> body = {
      constant.firstName: firstName ?? '',
      constant.lastName: lastName ?? '',
      constant.phone: phone ?? '',
      constant.deviceToken: '1234567890'
    };

    request.register(body, setAccount);

  }

  void setAccount(Object body) {
    print(body);
  }
}