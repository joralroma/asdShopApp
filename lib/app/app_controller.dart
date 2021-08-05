import 'package:asdshop/app/store/session.dart';
import 'package:get/get.dart';

class AppController extends GetxController {


  Future<void> logout() async {
    final Session _session = Get.find<Session>();
    await _session.logout();
  }


}