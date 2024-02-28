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
    await requestManager.get('https://mocki.io/v1/e865cc90-41d2-411e-9712-b80e8353a00c', authToken).then((response) {
      if(response.statusCode == 200) success = true;
      resolveStatusCode(response, callback);
    });
    return success;
  }
}