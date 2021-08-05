import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({Key? key}) : super(key: key);

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