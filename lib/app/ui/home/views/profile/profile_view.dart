import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Navigation
import 'package:asdshop/app/navigation/routes.dart';

// Controller
import 'package:asdshop/app/app_controller.dart';
import 'package:asdshop/app/ui/home/home_controller.dart';

// Widgets
import 'package:asdshop/app/ui/widgets/button.dart';
import 'package:asdshop/app/ui/widgets/text_item.dart';
import 'package:asdshop/app/ui/widgets/circle_avatar.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';


class ProfileView extends StatefulWidget {

  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final HomeController _homeController = Get.find<HomeController>();
  final AppController _appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    
    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

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
                url: _homeController.data.user!.imgProfile,
              ),
              const SizedBox(height: 50),
              AsdTextItem(
                label: _asdLocalization.translate('profile.name'),
                text: _homeController.data.user!.name,
              ),
              AsdTextItem(
                label: _asdLocalization.translate('profile.lastName'),
                text: _homeController.data.user!.lastName,
              ),
              AsdTextItem(
                label: _asdLocalization.translate('profile.email'),
                text: _homeController.data.user!.email,
              ),
              AsdTextItem(
                label: _asdLocalization.translate('profile.role'),
                text: (_homeController.data.user!.role == 1) ? _asdLocalization.translate('profile.seller') : _asdLocalization.translate('profile.user'),
              ),
              const SizedBox(height: 40),
              AsdButton(
                text: _asdLocalization.translate('profile.logout'),
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
    await _appController.logout();
    Get.offAllNamed(AsdPages.SplashPage);
  }
}