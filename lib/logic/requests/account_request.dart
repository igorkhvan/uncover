import 'package:uncover/logic/utils/http_mixin.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;

class AccountRequest with httpRequestMixin {
  Future<void> register(Map<String, dynamic>? body, Function? callback) async {
    await httpPost(constant.baseURL + constant.registration, body).then((response) {
      resolveStatusCode(response, callback);
    });
  }
}