import 'package:uncover/logic/models/account_model.dart';
import 'package:uncover/logic/repositories/http_requests.dart';
import 'package:uncover/logic/managers/request_manager.dart';
import 'package:uncover/logic/mixins/request_mixin.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;

class AccountRequest with requestMixin {

  HttpRequests http = HttpRequests();

  Future<bool> register(Map<String, dynamic>? body, Function? callback) async {
    RequestManager requestManager = RequestManager(http);

    bool success = false;
    await requestManager.post(constant.baseURL + constant.registration, body).then((response) {
      resolveStatusCode(response, callback);
      if(response.statusCode == 200) success = true;
    });
    return success;
  }

  Future<bool> updateUserProfile(Map<String, dynamic> body, AccountModel? account, {Function? callback}) async {
    RequestManager requestManager = RequestManager(http);

    bool success = false;
    await requestManager.post(constant.baseURL + constant.profile, body, authToken: account?.authToken ?? '').then((response) {
      resolveStatusCode(response, callback);
      if(response.statusCode == 200) success = true;
    });
    return success;
  }
}