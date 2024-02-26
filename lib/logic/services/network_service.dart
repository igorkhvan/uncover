abstract class NetworkService {
  Future put(String? url, Map<String, dynamic>? body);
  Future post(String? url, Map<String, dynamic>? body, {String? authToken});
  Future get(String? url, String? authToken);
}