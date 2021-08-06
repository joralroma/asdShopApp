import 'package:asdshop/app/ui/home/views/business/widgets/add_product.dart';
import 'package:flutter/material.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/modal.dart';
import 'package:asdshop/app/utils/responsive.dart';

class AsdFloatingButton extends StatelessWidget {

  const AsdFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return FloatingActionButton(
      onPressed: () => AsdModal.showModalBottom(context, AddProduct()),
      backgroundColor: AsdTheme.primaryColor,
      child: Center(
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 32,
        ),
      ),
    );

  }

}