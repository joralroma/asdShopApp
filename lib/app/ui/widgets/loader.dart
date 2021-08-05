import 'package:flutter/material.dart';

// Utils
import 'package:asdshop/app/utils/responsive.dart';

class AsdLoader extends StatelessWidget {

  const AsdLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final Responsive _responsive = Responsive(context);

    return Container(
      width: _responsive.wp(85),
      child: Image.asset(
        'assets/Imgs/loader.gif',
        fit: BoxFit.contain,
      )
    );

  }

}