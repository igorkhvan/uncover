import 'package:uncover/logic/utils/http_mixin.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;

class StrangerRequest with httpRequestMixin{
  Future<bool> getStrangers(String? authToken, Function? callback) async {
    bool success = false;
    await httpGet(constant.baseURL + constant.users, authToken).then((response) {
      if(response.statusCode == 200) success = true;
      resolveStatusCode(response, callback);
    });
    return success;
  }
}