import 'package:http/http.dart' as http;

mixin requestMixin {
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
