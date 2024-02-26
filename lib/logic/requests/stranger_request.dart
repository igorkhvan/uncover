import 'package:uncover/logic/mixins/request_mixin.dart';
import 'package:uncover/logic/services/constants_service.dart' as constant;
import 'package:uncover/logic/repositories/http_requests.dart';
import 'package:uncover/logic/managers/request_manager.dart';

class StrangerRequest with requestMixin{

  final HttpRequests http = HttpRequests();

  Future<bool> getStrangers(String? authToken, Function? callback) async {
    final RequestManager requestManager = RequestManager(http);

    bool success = false;
    // await httpGet(constant.baseURL + constant.users, authToken).then((response) {
    //   if(response.statusCode == 200) success = true;
    //   resolveStatusCode(response, callback);
    // });
    await requestManager.get('https://mocki.io/v1/3c3d8209-362a-4254-ac9a-d7b4abab0340', authToken).then((response) {
      if(response.statusCode == 200) success = true;
      resolveStatusCode(response, callback);
    });
    return success;
  }
}