import 'package:asdshop/app/navigation/routes.dart';
import 'package:asdshop/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';
import 'package:get/route_manager.dart';

// Widgets
import 'text_item.dart';
import 'package:asdshop/app/ui/widgets/button.dart';
import 'package:asdshop/app/ui/widgets/circle_avatar.dart';

// Utils
import 'package:asdshop/app/utils/responsive.dart';


class ProfileView extends GetWidget<HomeController> {

  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              AsdCircleAvatar(
                radius: _responsive.wp(18),
                url: controller.data.user!.imgProfile,
              ),
              const SizedBox(height: 50),
              AsdTextItem(
                label: 'Nombre',
                text: controller.data.user!.name,
              ),
              AsdTextItem(
                label: 'Apellido',
                text: controller.data.user!.lastName,
              ),
              AsdTextItem(
                label: 'Email',
                text: controller.data.user!.email,
              ),
              AsdTextItem(
                label: 'Rol',
                text: (controller.data.user!.role == 1) ? 'Vendedor' : 'Usuario',
              ),
              const SizedBox(height: 40),
              ButtonAsd(
                text: 'Cerrar Sesión',
                onPressed: _logout,
                color: AsdTheme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );

  }

  void _logout() async {
    await controller.appController.logout();
    Get.offAllNamed(AsdPages.SplashPage);
  }

}