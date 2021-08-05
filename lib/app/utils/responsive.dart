import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive {

  late double width, height, inch;

  late EdgeInsets padding;

  late MediaQueryData data;

  Responsive(BuildContext context) {

    data = MediaQuery.of(context);
    data = data.copyWith( textScaleFactor: data.textScaleFactor.clamp(.9, 1.0) );
    final Size size = data.size;

    width = size.width;
    height = size.height;

    inch = math.sqrt(math.pow(width, 2) + math.pow(height, 2));

    padding = data.padding;

  }

  double wp(double percent) {
    return width * percent / 100;
  }


  double hp(double percent) {
    return height * percent / 100;
  }


  double ip(double percent) {
    return inch * percent / 100;
  }

}
