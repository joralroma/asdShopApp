import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

// Navigation
import 'package:asdshop/app/navigation/routes.dart';

// Controller
import 'package:asdshop/app/ui/main/splash/splash_controller.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final SplashController _splashController = Get.find<SplashController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _initState();
    });  
  }

  void _initState() async {
    final bool _isLogged = await _splashController.verifyInitApp();
    if(_isLogged) Get.offAllNamed(AsdPages.HomePage);
    else Get.offAllNamed(AsdPages.LoginPage);    
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AsdTheme.primaryColor,
      body: SafeArea(
        child: Container(
          child: SvgPicture.asset(
            'assets/Imgs/splash.svg',
            fit: BoxFit.cover,
          )          
        )
      ),
    );

  }
}