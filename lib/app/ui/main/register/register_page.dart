import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// Models
import 'package:asdshop/app/models/error.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Navigation
import 'package:asdshop/app/navigation/routes.dart';

// Controller
import 'package:asdshop/app/ui/main/register/register_controller.dart';

// Widgets
import 'package:asdshop/app/ui/widgets/input.dart';
import 'package:asdshop/app/ui/widgets/button.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/modal.dart';
import 'package:asdshop/app/utils/responsive.dart';
import 'package:asdshop/app/utils/extencions.dart';

class RegisterPage extends GetWidget<RegisterController> {

  const RegisterPage({
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
                    const SizedBox(height: 30),
                    InputAsd(
                      placeholder: _asdLocalization.translate('register.name'),
                      model: controller.name,
                    ),
                    const SizedBox(height: 30),
                    InputAsd(
                      placeholder: _asdLocalization.translate('register.lastName'),
                      model: controller.lastName,
                    ),
                    const SizedBox(height: 30),
                    InputAsd(
                      placeholder: _asdLocalization.translate('register.email'),
                      model: controller.username,
                    ),
                    const SizedBox(height: 30),
                    InputAsd(
                      placeholder: _asdLocalization.translate('register.password'),
                      model: controller.password,
                    ),
                    const SizedBox(height: 30),
                    AsdButton(
                      text: _asdLocalization.translate('register.register'),
                      onPressed: () => _doRegister(context),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        _asdLocalization.translate('register.haveAccount'),
                        style: AsdTheme.styleText.copyWith(
                          fontSize: _responsive.ip(1.6),
                          color: Colors.white,
                          fontStyle: FontStyle.italic
                        ),
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

  void _doRegister(BuildContext context) async {
    if(controller.verifyForm) {
      AsdModal.showModalLoader(context);
      final AsdError? _result = await controller.doRegister();
      Get.back();
      if(_result == null) {
        Get.offAllNamed(AsdPages.HomePage);
      } else {
        AsdModal.showSnackbar(context, '¡Error!', _result.message);
      }
    } else {
      AsdModal.showSnackbar(context, '¡Error!', 'Dedes llenar todos los campos.');
    }
  }

}