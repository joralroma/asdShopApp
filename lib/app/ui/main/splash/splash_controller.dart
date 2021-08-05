import 'dart:async';
import 'package:get/get.dart';

// Navigation
import 'package:asdshop/app/navigation/routes.dart';

// Session
import 'package:asdshop/app/store/session.dart';

class SplashController extends GetxController {

  final Session session = Get.find<Session>();

  @override
  void onReady() {
    _verifyInitApp();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void _verifyInitApp() async {
    Timer(Duration(seconds: 3), () => this._getPage()); 
  }

  void _getPage() async {
    final bool _isLogged = await session.isLogged();
    if(_isLogged) Get.offAllNamed(AsdPages.HomePage);
    else Get.offAllNamed(AsdPages.LoginPage);
  }

}