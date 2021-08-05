import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AsdStore {

  final Map<String, String> keys = {
    "keyToken": "AsdSessionToken",
  };

  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<void> setToken(String? token) async {
    await storage.write(key: keys["keyToken"]!, value: token);
  }

  Future<String?> getToken() async {
    final String? value = await storage.read(key: keys["keyToken"]!);
    return value;
  }

  Future<void> deleteAllStorage() async {
    await storage.deleteAll();
  }

  Future<bool> validateToken() async {
    final String? value = await getToken();
    print(value);
    if(value != null) {
      return true;
    }
    return false;
  }

}
