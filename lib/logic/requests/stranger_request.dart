import 'package:uncover/logic/mixins/request_mixin.dart';
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
    await requestManager.get('https://mocki.io/v1/5d283493-0870-4b78-91da-8f0c6da2e215', authToken).then((response) {
      if(response.statusCode == 200) success = true;
      resolveStatusCode(response, callback);
    });
    return success;
  }
}