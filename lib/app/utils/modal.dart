import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

// Widgets
import 'package:asdshop/app/ui/widgets/loader.dart';


class AsdModal {

  static void showSnackbar(BuildContext context, String title, String msm, {Color bg = Colors.red}) {
    Responsive _responsive = Responsive(context);
    Get.snackbar(
      title,
      msm,
      backgroundColor: bg,
      messageText: Text(
        msm,
        style: AsdTheme.styleTitle.copyWith(
          color: Colors.white,
          fontSize: _responsive.ip(1.6)
          // fontSize: 18
        ),
      ),
      titleText: Text(
        title,
        style: AsdTheme.styleTitle.copyWith(
          color: Colors.white,
          fontSize: _responsive.ip(2.0)
          // fontSize: 22
        ),
      )
    );
  }

  static void showModalLoader(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ),          
            Center(child: AsdLoader())
          ],
        ),
      ),
    );
  }

  static void showModalBottom(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      builder: (_) => widget
    );
  }

}