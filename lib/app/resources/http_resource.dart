import 'package:http/http.dart';

abstract class HttpResource {
  
  Future<Response> httpGet(String url);
  Future<Response> httpPost(String url, Map body);

}