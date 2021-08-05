import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';

class AsdBottomNavigation extends GetView<HomeController> {

  const AsdBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(
      () => BottomNavigationBar(
        onTap: controller.setPage,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex,
        selectedItemColor: AsdTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: AsdTheme.styleText.copyWith( fontSize: 0.0 ),
        unselectedLabelStyle: AsdTheme.styleText.copyWith( fontSize: 0.0 ),
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.home ),
            activeIcon: Icon( Icons.home),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.add_shopping_cart),
            activeIcon: Icon( Icons.add_shopping_cart),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.add_business ),
            activeIcon: Icon( Icons.add_business ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.person),
            activeIcon: Icon( Icons.person),
            label: ''
          ),
        ],
      ),
    );

  }

}