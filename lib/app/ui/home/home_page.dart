import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// Widgets
import 'widgets/home_loader.dart';
import 'views/body/body_view.dart';
import 'widgets/floating_button.dart';
import 'widgets/bottom_navigation.dart';
import 'views/profile/profile_view.dart';
import 'views/shopping/shopping_view.dart';
import 'views/business/business_view.dart';

// Models
import 'package:asdshop/app/models/error.dart';

// Utils
import 'package:asdshop/app/utils/modal.dart';


class HomePage extends StatefulWidget {

  const HomePage({
    Key? key
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getDataUser(context);
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent
    ));    
  }

  List<Widget> _views = [
    BodyView(),
    ShoppingView(),
    BusinessView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: _homeController.readyView ? _views[_homeController.currentIndex] : HomeLoader(),
                ),
              ],
            ),
          )
        ),
        floatingActionButton: (_homeController.readyView && _homeController.currentIndex == 2 && _homeController.data.user!.role == 1) ? AsdFloatingButton() : null,
        bottomNavigationBar: AsdBottomNavigation(),
      ),
    );

  }

  void _getDataUser(BuildContext context) async {
    if(_homeController.data.user == null) {      
      final AsdError? error = await _homeController.getDataUser();
      if(error == null) {
        _getListProducts(context);
      } else {
        AsdModal.showSnackbar(context, '??Error!', error.message);
      }
    } else {
      _getListProducts(context);
    }
  }

  void _getListProducts(BuildContext context) async {
    final AsdError? error = await _homeController.getListPrducts();
    if(error == null) {
      _doSuccessGetListProducts();
    } else {
      AsdModal.showSnackbar(context, '??Error!', error.message);
    }
  }

  void _doSuccessGetListProducts() {
    if(_homeController.data.user?.role != 1) {
      _views.removeAt(2);
    }
  }

}