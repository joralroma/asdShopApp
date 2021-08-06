import 'package:get/instance_manager.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

// Providers
import 'package:asdshop/app/providers/http_provider.dart';
import 'package:asdshop/app/providers/main_provider.dart';

// Controllers
import 'register_controller.dart';


class RegisterBinding implements Bindings{

  @override
  void dependencies() {
    final MainProvider _mainProvider = MainProvider(HttpProvider());
    Get.put<RegisterController>(RegisterController(_mainProvider));
  }

}