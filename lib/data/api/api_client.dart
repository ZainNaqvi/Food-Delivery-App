import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late String appbaseurl;
  late Map<String, String> _mainHeader;
  ApiClient({required String appbaseurl}) {
    baseUrl:
    appbaseurl;
    timeout:
    Duration(seconds: 30);
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer $token",
    };
  }
  // POST METHOD
  Future<Response> getData({
    required String uri,
  }) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
