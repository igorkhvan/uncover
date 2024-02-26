import 'package:http/http.dart' as http;
import 'package:uncover/logic/utils/network_requests.dart';

class HttpRequests implements NetworkRequests{
  @override
  Future<http.Response> post(String? url, Map<String, dynamic>? body, {String? authToken}) {
    return http.post(
      Uri.parse(url ?? ''),
      body: body,
      headers: {
        // 'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken ?? ''}'
      },
    );
  }

  @override
  Future<http.Response> put(String? url, Map<String, dynamic>? body) {
    return http.put(
      url as Uri,
      body: body,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json'
      },
    );
  }

  @override
  Future<http.Response> get(String? url, String? authToken) {
    return http.get(
      Uri.parse(url ?? ''),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken ?? ''}'
      },
    );
  }
}