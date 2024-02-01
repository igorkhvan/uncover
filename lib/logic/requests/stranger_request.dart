import 'package:uncover/logic/utils/http_mixin.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;

class StrangerRequest with httpRequestMixin{
  Future<void> getStrangers(String? authToken, Function? callback) async {
    await httpGet(constant.baseURL + constant.users, authToken).then((response) {
      resolveStatusCode(response, callback);
    });
  }
}