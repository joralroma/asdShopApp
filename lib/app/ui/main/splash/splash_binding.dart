import 'package:get/instance_manager.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

// Controllers
import 'splash_controller.dart';

class SplashBinding implements Bindings{

  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }

}