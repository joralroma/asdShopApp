import 'package:get/get.dart';

// Pages
import 'package:asdshop/app/ui/home/home_page.dart';
import 'package:asdshop/app/ui/main/login/login_page.dart';
import 'package:asdshop/app/ui/main/splash/splash_page.dart';


// Binding
import 'package:asdshop/app/ui/home/home_binding.dart';
import 'package:asdshop/app/ui/main/login/login_binding.dart';
import 'package:asdshop/app/ui/main/splash/splash_binding.dart';

class AsdPages {

  static const String SplashPage = '/';
  static const String LoginPage = '/login';
  static const String HomePage = '/home';

}


List<GetPage> routes = [
  GetPage(
    name: AsdPages.SplashPage,
    page: () => SplashPage(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: AsdPages.LoginPage,
    page: () => LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: AsdPages.HomePage,
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
];