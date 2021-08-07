import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// Controller
import '../business_controller.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Models
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';
import 'package:asdshop/app/ui/widgets/input.dart';

// Widgets
import 'select_imgs.dart';
import 'select_category.dart';
import 'loader_add_product.dart';
import 'package:asdshop/app/ui/widgets/button.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/modal.dart';
import 'package:asdshop/app/utils/responsive.dart';



class AddProduct extends StatefulWidget {

  const AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final BusinessController _businessController = Get.find<BusinessController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getDataCategories(context);
    });   
  }

  @override
  Widget build(BuildContext context) {

    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

    final Responsive _responsive = Responsive(context);

    return Obx(
      () => _businessController.readyView ? GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: DraggableScrollableSheet(
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
                Center(
                  child: Text(
                    _asdLocalization.translate('business.titleAddProduct'),
                    style: AsdTheme.styleTitle.copyWith(
                      fontSize: _responsive.ip(2.4)
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InputAsd(
                  placeholder: _asdLocalization.translate('business.name'),
                  model: _businessController.name,
                  colorText: AsdTheme.colorText,
                ),
                const SizedBox(height: 20),
                InputAsd(
                  placeholder: _asdLocalization.translate('business.stock'),
                  model: _businessController.stock,
                  textInputType: TextInputType.number,
                  colorText: AsdTheme.colorText,
                ),
                const SizedBox(height: 20),
                InputAsd(
                  placeholder: _asdLocalization.translate('business.price'),
                  model: _businessController.price,
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  colorText: AsdTheme.colorText,
                ),
                const SizedBox(height: 20),                
                InputAsd(
                  placeholder: _asdLocalization.translate('business.description'),
                  model: _businessController.description,
                  maxLines: 3,
                  colorText: AsdTheme.colorText,
                ),
                const SizedBox(height: 20),
                SelectCategory(
                  category: _businessController.category,
                  categories: _businessController.data.categories
                ),
                const SizedBox(height: 20),
                Selectimgs(imgs: _businessController.data.imgs, toggleUrl: _businessController.toggleUrl),
                const SizedBox(height: 30),
                AsdButton(
                  text: _asdLocalization.translate('business.save'),
                  color: AsdTheme.primaryColor,
                  onPressed: () => _doAddProduct(context, _asdLocalization),
                )
              ]
            ),
          ),
        ),
      ) : Container(
        child: AddProductLoader(),
        color: Colors.white,
      ),
    );

  }


  void _getDataCategories(BuildContext context) async {
    final AsdError? error = await _businessController.getListCategory();
    if(error != null) {
      Get.back();
      AsdModal.showSnackbar(context, '¡Error!', error.message);
    }
  }

  void _doAddProduct(BuildContext context, AsdLocalization _asdLocalization) async {
    if(_businessController.verifyForm) {
      AsdModal.showModalLoader(context);
      final AsdError? _error = await _businessController.saveProduct();
      Get.back();
      if(_error == null) {
        Get.back();
        AsdModal.showSnackbar(context, '¡Error!', _asdLocalization.translate('business.successAddProduct'), bg: Colors.green);
      } else {
        AsdModal.showSnackbar(context, '¡Error!', _error.message);
      }
    } else {
      AsdModal.showSnackbar(context, '¡Error!', _asdLocalization.translate('business.errorData'));
    }
  }
}