import 'package:uncover/logic/utils/network_requests.dart';

class RequestManager {
  final NetworkRequests request;
  RequestManager(this.request);

  Future put(String? url, Map<String, dynamic>? body) {
    return request.put(url, body);
  }

  Future post(String? url, Map<String, dynamic>? body, {String? authToken}) {
    return request.post(url, body);
  }

  Future get(String? url, String? authToken) {
    return request.get(url, authToken);
  }
}