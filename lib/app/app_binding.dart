import 'package:get/get.dart';


// Controllers
import 'app_controller.dart';

// Store
import 'store/store.dart';
import 'store/session.dart';


class AppBinding implements Bindings{

  @override
  void dependencies() {
    Get.put<AppController>(AppController());
    Get.put<AsdStore>(AsdStore());
    Get.put<Session>(Session());
  }

}