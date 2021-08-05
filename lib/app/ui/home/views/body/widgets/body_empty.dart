import 'package:asdshop/app/utils/theme.dart';
import 'package:flutter/material.dart';

// Utils
import 'package:asdshop/app/utils/responsive.dart';

class BodyEmpty extends StatelessWidget {

  const BodyEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      child: Center(
        child: Text(
          'No hay productos agregados.',
          textAlign: TextAlign.center,
          style: AsdTheme.styleTitle.copyWith(
            fontSize: _responsive.ip(4.0),
            color: AsdTheme.primaryColor,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );

  }

}