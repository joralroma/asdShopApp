import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// Controller
import 'package:asdshop/app/ui/main/register/register_controller.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class SelectRole extends GetWidget<RegisterController> {

  const SelectRole({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AsdLocalization _asdLocalization = AsdLocalization.of(context);

    final Responsive _responsive = Responsive(context);

    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: AsdTheme.border
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => Positioned(
              top: 1.5,
              left: 1.5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _responsive.wp(43.5),
                height: 54,
                margin: EdgeInsets.only(left: (controller.role.value == 1) ? _responsive.wp(45) : 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ),
          ),
          Row(
            children: [
              SelectRoleItem(
                text: _asdLocalization.translate('profile.user'),
                role: 2,
                onSelectRole: _onSelectRole,
              ),
              SelectRoleItem(
                text: _asdLocalization.translate('profile.seller'),
                role: 1,
                onSelectRole: _onSelectRole,
              ),
            ],
          ),
        ],
      ),
    );

  }

  void _onSelectRole(int role) {
    controller.role.value = role;
  }

}

class SelectRoleItem extends StatelessWidget {

  const SelectRoleItem({
    Key? key,
    required this.text,
    required this.role,
    required this.onSelectRole,
  }) : super(key: key);

  final String text;
  final int role;
  final Function(int) onSelectRole;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => onSelectRole(role),
        child: Center(
          child: Text(
            text,
            style: AsdTheme.styleText.copyWith(
              fontSize: _responsive.ip(1.8)
            ),
          ),
        ),
      ),
    );

  }

}