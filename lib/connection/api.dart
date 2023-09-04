import 'package:dio/dio.dart';
import 'package:giftminder/config/config.dart';
import 'package:http/http.dart' as http;

class DioApi {

   static Future<dynamic> postApi(String path,dynamic postdata)async{
    Response response;
    var dio = Dio();
    try {
      response = await dio.post(ConfigUrl.baseUrl+path, data: postdata);
      print(response);
      return response;
    } on DioError catch (eror) {

    }
  }

    static Future<http.StreamedResponse> postApihttp(String path,dynamic postData)async{
      var request = http.MultipartRequest('POST', Uri.parse(ConfigUrl.baseUrl+path));
      request.fields.addAll(postData);
      http.StreamedResponse response = await request.send();
      return response;
    }
    static Future<http.StreamedResponse> postApihttptoken(String token, String path,dynamic postData)async{
        var request = http.MultipartRequest('POST', Uri.parse(ConfigUrl.baseUrl+path));
        request.fields.addAll(postData);
        request.headers["token"] = token;
        http.StreamedResponse response = await request.send();
        return response;
    }

}