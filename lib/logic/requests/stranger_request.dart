import 'package:uncover/logic/utils/http_mixin.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;

class StrangerRequest with httpRequestMixin{
  Future<bool> getStrangers(String? authToken, Function? callback) async {
    bool success = false;
    // await httpGet(constant.baseURL + constant.users, authToken).then((response) {
    //   if(response.statusCode == 200) success = true;
    //   resolveStatusCode(response, callback);
    // });
    await httpGet('https://mocki.io/v1/3c3d8209-362a-4254-ac9a-d7b4abab0340', authToken).then((response) {
      if(response.statusCode == 200) success = true;
      resolveStatusCode(response, callback);
    });
    return success;
  }
}