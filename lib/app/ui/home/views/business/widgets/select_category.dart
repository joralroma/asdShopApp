import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

// Models
import 'package:asdshop/app/models/category.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class SelectCategory extends StatelessWidget {

  const SelectCategory({
    Key? key,
    required this.category,
    required this.categories,
  }) : super(key: key);

  final Rx<Category> category;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: categories.map((e) => Obx(
        () => GestureDetector(
          onTap: () => category.value = e,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: (category.value.name == e.name) ? Colors.green : Colors.grey.withOpacity(.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              e.name,
              style: AsdTheme.styleText.copyWith(
                fontSize: _responsive.ip(1.6),
                color: (category.value.name == e.name) ? Colors.white : AsdTheme.colorText
              ),
            ),
          ),
        ),
      )).toList(),
    );

  }

}