import 'package:flutter/material.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class BusinessHeader extends StatelessWidget {

  const BusinessHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

    final Responsive _responsive = Responsive(context);

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 20),
      child: Text(
        _asdLocalization.translate('business.title'),
        style: AsdTheme.styleTitle.copyWith(
          fontSize: _responsive.ip(2.8)
        ),
      ),
    );

  }

}