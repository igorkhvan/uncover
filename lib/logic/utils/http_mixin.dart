import 'package:http/http.dart' as http;

mixin httpRequestMixin {
  Future<http.Response> httpPost(String? url, Map<String, dynamic>? body) {
    return http.post(
      Uri.parse(url ?? ''),
      body: body,
      headers: {
        // 'Content-Type': 'multipart/form-data',
        'Accept': 'application/json'
      },
    );
  }

  Future<http.Response> httpPut(String? url, Map<String, dynamic>? body) {
    return http.put(
      url as Uri,
      body: body,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json'
      },
    );
  }

  Future<http.Response> httpGet(String? url, String? authToken) {
    return http.get(
      Uri.parse(url ?? ''),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken ?? ''}'
      },
    );
  }

  void resolveStatusCode(http.Response response, Function? callback) {
    switch (response.statusCode) {
      case 200:
        {
          if (callback != null) callback(response);
        }
        break;

      case 422:
        {

        }

      case 500:
        {
          // setErrorMessage('Ошибка сервера');
        }
        break;

      default:
        {
          // setErrorMessage(response.reasonPhrase);
        }
        break;
    }
  }
}
