import 'package:asdshop/app/ui/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';


// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class BodyHeader extends GetWidget<HomeController> {

  const BodyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.grey,
                size: 30,
              ),
              AsdCircleAvatar(
                radius: _responsive.wp(8),
                url: controller.data.user!.imgProfile,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Bienvenido, ${controller.data.user?.name}',
            style: AsdTheme.styleTitle.copyWith(
              fontSize: _responsive.ip(2.6)
            ),
          )
        ],
      ),
    );

  }

}