import 'package:flutter/material.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class BodyEmpty extends StatelessWidget {

  const BodyEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          _asdLocalization.translate('body.productsEmpty'),
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