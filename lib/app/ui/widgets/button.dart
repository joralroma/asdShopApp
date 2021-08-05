import 'package:flutter/material.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class ButtonAsd extends StatelessWidget {

  const ButtonAsd({
    Key? key,
    required this.text,
    this.colorText = Colors.white,
    this.color = Colors.transparent,
    this.colorBorder = Colors.white,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color colorText;
  final Color colorBorder;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      disabledElevation: 0,
      minWidth: _responsive.wp(85),
      height: 55,
      color: color,
      disabledColor: color,
      child: Text(
        text,
        style: AsdTheme.styleText.copyWith(
          color: colorText,
          fontSize: _responsive.ip(1.8)
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide( width: 1, color: colorBorder ),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );

  }

}