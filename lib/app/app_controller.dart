import 'package:get/get.dart';

// Store
import 'package:asdshop/app/store/session.dart';
class AppController extends GetxController {


  Future<void> logout() async {
    final Session _session = Get.find<Session>();
    await _session.logout();
  }


}