import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Provider
import 'package:asdshop/app/providers/home_provider.dart';
import 'package:asdshop/app/providers/http_provider.dart';

// Widgets
import 'widgets/business_header.dart';
import 'package:asdshop/app/ui/home/views/body/widgets/product_item.dart';

// Controller
import 'package:asdshop/app/ui/home/views/business/business_controller.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';


class BusinessView extends StatefulWidget {

  const BusinessView({Key? key}) : super(key: key);

  @override
  _BusinessViewState createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {

  final BusinessController _businessController = Get.put<BusinessController>(BusinessController(HomeProvider(HttpProvider())));

  @override
  Widget build(BuildContext context) {

    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

    final Responsive _responsive = Responsive(context);

    return Obx(
      () => _businessController.products.isEmpty ? Center(
        child: Text(
          _asdLocalization.translate('business.productsEmpty'),
          textAlign: TextAlign.center,
          style: AsdTheme.styleTitle.copyWith(
            fontSize: _responsive.ip(3.8)
          ),
        ),        
      ) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BusinessHeader(),
              ..._businessController.products.map((e) => ProductItem(product: e, buy: false)).toList()
            ],
          ),
        ),
      ),
    );

  }
}