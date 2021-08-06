import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/utils/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Models
import 'package:asdshop/app/models/product.dart';

// Widgets
import 'package:asdshop/app/ui/widgets/button.dart';
import 'package:asdshop/app/ui/widgets/text_item.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:get/route_manager.dart';


class ProductDetaild extends GetWidget<HomeController> {

  const ProductDetaild({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;

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
            Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: AsdTheme.border
                )
              ),
              child: (product.imgs.isNotEmpty) ? ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: product.imgs.first,
                ),
              ) : const SizedBox.shrink(),
            ),
            AsdTextItem(
              label: _asdLocalization.translate('body.name'),
              text: product.name,
            ),
            AsdTextItem(
              label: _asdLocalization.translate('body.description'),
              text: product.description,
              maxLines: 4,
            ),
            AsdTextItem(
              label: _asdLocalization.translate('body.stock'),
              text: '${product.stock}',
              maxLines: 4,
            ),
            AsdTextItem(
              label: _asdLocalization.translate('body.price'),
              text: '\$ ${product.price}',
              maxLines: 4,
            ),
            const SizedBox(height: 50),
            AsdButton(
              text: _asdLocalization.translate('body.buy'),
              color: AsdTheme.primaryColor,
              onPressed: () => _doBuyProduct(context, _asdLocalization),
            )
          ]
        ),
      ),
    );

  }

  void _doBuyProduct(BuildContext context, AsdLocalization _asdLocalization) async {
    AsdModal.showModalLoader(context);
    final Map<String, dynamic> body = {'total': product.price, 'product': product.id};
    final AsdError? _result = await controller.saveShopping(body, product);
    Get.back();
    if(_result == null) {
      Get.back();
      AsdModal.showSnackbar(context, 'Ok!', _asdLocalization.translate('body.purchaseSuccessful'), bg: Colors.lightGreen);
    } else {
      AsdModal.showSnackbar(context, '¡Error!', _result.message);
    }    
  }

}