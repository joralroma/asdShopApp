import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stores
import 'store.dart';

class Session  {
  
  late SharedPreferences _sharedPreferences;
  final AsdStore store = Get.find<AsdStore>();

  Future<bool> isLogged() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (_sharedPreferences.getBool('first_run') ?? true) {
      await store.deleteAllStorage();
      _sharedPreferences.setBool('first_run', false);
      return false;
    }
    return await _verifyToken();
  }

  Future<bool> _verifyToken() async {
    final bool token = await store.validateToken();
    if(token){
      return true;
    }
    await store.deleteAllStorage();
    return false;
  }

  Future<void> logout() async {
    await store.deleteAllStorage();
  }

}