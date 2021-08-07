import 'dart:async';
import 'package:get/get.dart';

// Store
import 'package:asdshop/app/store/session.dart';

class SplashController extends GetxController {

  final Session session = Get.find<Session>();

  Future<bool> verifyInitApp() async {
    await Future.delayed(Duration(seconds: 3));
    final bool _isLogged = await session.isLogged();
    return _isLogged;
  }

}