import 'dart:convert';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' show Client, Response;

// Resources
import 'package:asdshop/app/resources/http_resource.dart';

// Stores
import 'package:asdshop/app/store/store.dart';
import 'package:asdshop/app/store/config.dart';

// Utils
import 'package:asdshop/app/utils/extencions.dart';

class HttpProvider implements HttpResource {

  final Client _client = Client();
  final Config _config = Config();

  final AsdStore store = Get.find<AsdStore>();

  String _baseUrl = '';
  
  HttpProvider() {
    _baseUrl = _config.prod ? _config.urlBackProd : _config.urlBackDev;
  }

  Future<Map<String, String>> _getHeaders() async {
    final String? _token = await store.getToken();
    Map<String, String> _headers = {
      "content-type": "application/json; charset=UTF-8",
      "Accept": "application/json",
      if(_token.valid) 'authorization' : _token!
    };
    return _headers;
  }


  @override
  Future<Response> httpGet(String url) async {
    final Uri uri = Uri.parse(_baseUrl + url);
    return _client.get(
      uri,
      headers: await _getHeaders(),
    );
  }
  
  @override
  Future<Response> httpPost(String url, Map body) async {
    final Uri uri = Uri.parse(_baseUrl + url);
    print(uri);
    return _client.post(
      uri,
      headers: await _getHeaders(),
      body: json.encode(body)
    );
  }

  
}