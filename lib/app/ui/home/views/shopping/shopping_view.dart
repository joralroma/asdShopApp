import 'package:asdshop/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// Models
import 'package:asdshop/app/models/error.dart';

// Widgets
import 'package:asdshop/app/ui/home/views/shopping/widgets/shopping_item.dart';
import 'package:asdshop/app/ui/home/views/shopping/widgets/shopping_loader.dart';

// Provider
import 'package:asdshop/app/providers/home_provider.dart';
import 'package:asdshop/app/providers/http_provider.dart';

// Controller
import 'shopping_controller.dart';

// Utils
import 'package:asdshop/app/utils/modal.dart';
import 'package:asdshop/app/utils/responsive.dart';

class ShoppingView extends StatefulWidget {

  const ShoppingView({Key? key}) : super(key: key);

  @override
  _ShoppingViewState createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {

  final ShoppingController _shoppingController = ShoppingController(HomeProvider(HttpProvider()));


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getListPurchase(context);
    });   
  }

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Obx(
      () => _shoppingController.readyView ? ( _shoppingController.data.shopping!.isEmpty ? Center(
        child: Text(
          'Aún no ha hecho su primera compra.',
          textAlign: TextAlign.center,
          style: AsdTheme.styleTitle.copyWith(
            fontSize: _responsive.ip(3.8)
          ),
        ),
      ) :
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Historial de compras',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AsdTheme.styleTitle.copyWith(
                      fontSize: _responsive.ip(2.6)
                    ),
                  )
                ),
                ..._shoppingController.data.shopping!.map((e) => ShoppingItem(shopping: e)).toList(),
              ],
            ),
          ),
        )
      ) : ShoppingLoader()
    );

  }

  void _getListPurchase(BuildContext context) async {
    final AsdError? result = await _shoppingController.getListPurchase();
    if(result != null) {
      AsdModal.showSnackbar(context, '¡Error!', result.message);
    }
  }

}