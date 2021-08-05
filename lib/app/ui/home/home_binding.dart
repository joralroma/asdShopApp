import 'package:asdshop/app/providers/main_provider.dart';
import 'package:get/get.dart';

// Providers
import 'package:asdshop/app/providers/home_provider.dart';
import 'package:asdshop/app/providers/http_provider.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {
    final HttpProvider _httpProvider = HttpProvider();
    final MainProvider _mainProvider = MainProvider(_httpProvider);
    final HomeProvider _homeProvider = HomeProvider(_httpProvider);
    Get.put<HomeController>(HomeController(_mainProvider, _homeProvider));
  }

}