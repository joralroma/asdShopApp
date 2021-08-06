import 'package:asdshop/app/i18n/asd_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// Navigation
import 'package:asdshop/app/navigation/routes.dart';

// Controller
import 'package:asdshop/app/ui/main/login/login_controller.dart';

// Widgets
import 'package:asdshop/app/ui/widgets/input.dart';
import 'package:asdshop/app/ui/widgets/button.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/modal.dart';
import 'package:asdshop/app/utils/responsive.dart';
import 'package:asdshop/app/utils/extencions.dart';

class LoginPage extends GetWidget<LoginController> {

  const LoginPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

    return Scaffold(
      backgroundColor: AsdTheme.primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ASD',
                      style: AsdTheme.styleTitle.copyWith(
                        fontSize: _responsive.ip(4.8),
                        color: Colors.white,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    const SizedBox(height: 40),
                    InputAsd(
                      placeholder: _asdLocalization.translate('login.email'),
                      model: controller.username,
                    ),
                    const SizedBox(height: 40),
                    InputAsd(
                      placeholder: _asdLocalization.translate('login.password'),
                      model: controller.password,
                    ),
                    const SizedBox(height: 40),
                    AsdButton(
                      text: _asdLocalization.translate('login.login'),
                      onPressed: () => _dologin(context),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      _asdLocalization.translate('login.dontHaveAccount'),
                      style: AsdTheme.styleText.copyWith(
                        fontSize: _responsive.ip(1.6),
                        color: Colors.white,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

  void _dologin(BuildContext context) async {
    if(controller.verifyForm) {
      AsdModal.showModalLoader(context);
      final String _result = await controller.doLogin();
      Get.back();
      Get.toNamed(AsdPages.HomePage);
      if(_result.valid) {
        AsdModal.showSnackbar(context, '¡Error!', _result);
      }
    } else {
      AsdModal.showSnackbar(context, '¡Error!', 'Dedes llenar todos los campos.');
    }
  }

}