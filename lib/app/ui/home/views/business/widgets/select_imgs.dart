import 'package:flutter/material.dart';

// Widgets
import 'img_item.dart';

class Selectimgs extends StatelessWidget {

  const Selectimgs({
    Key? key,
    required this.imgs,
    required this.toggleUrl,
  }) : super(key: key);

  final List<String> imgs;
  final Function(String) toggleUrl;

  @override
  Widget build(BuildContext context) {

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,      
      children: imgs.map((e) => ImgItem(url: e, toggleUrl: toggleUrl)).toList(),
    );

  }

}