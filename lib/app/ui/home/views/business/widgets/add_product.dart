import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Models
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';

// Widgets
import 'package:asdshop/app/ui/widgets/button.dart';
import 'package:asdshop/app/ui/widgets/text_item.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/modal.dart';


class AddProduct extends GetWidget<HomeController> {

  const AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.95, //set this as you want
      maxChildSize: 0.95, //set this as you want
      minChildSize: 0.95, //set this as you want
      expand: true,      
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.only(top: 40, right: 20.0, bottom: 20.0, left: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        child: ListView(
          children: <Widget>[
          ]
        ),
      ),
    );

  }

  void _doAddProduct(BuildContext context, AsdLocalization _asdLocalization) async {   
  }

}