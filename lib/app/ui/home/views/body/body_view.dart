import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// Widgets
import 'widgets/body_empty.dart';
import 'widgets/body_header.dart';
import 'widgets/product_item.dart';

class BodyView extends GetWidget<HomeController> {

  const BodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const BodyHeader(),
            Obx(
              () => controller.products.isEmpty ? const BodyEmpty() : Column(
                children: controller.products.where(controller.filter).map((e) => ProductItem(product: e)).toList()
              )
            )
          ],
        ),
      )
    );

  }

}