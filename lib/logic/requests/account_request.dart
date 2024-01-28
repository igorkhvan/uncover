import 'package:uncover/logic/models/account_model.dart';
import 'package:uncover/logic/utils/http_mixin.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;

class AccountRequest with httpRequestMixin {

  Future<bool> register(Map<String, dynamic>? body, Function? callback) async {
    bool success = false;
    await httpPost(constant.baseURL + constant.registration, body).then((response) {
      resolveStatusCode(response, callback);
      if(response.statusCode == 200) success = true;
    });
    return success;
  }

  Future<bool> updateUserProfile(Map<String, dynamic> body, AccountModel? account, {Function? callback}) async {
    bool success = false;
    await httpPost(constant.baseURL + constant.profile, body, authToken: account?.authToken ?? '').then((response) {
      resolveStatusCode(response, callback);
      if(response.statusCode == 200) success = true;
    });
    return success;
  }
}