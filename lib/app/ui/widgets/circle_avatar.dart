import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AsdCircleAvatar extends StatelessWidget {

  const AsdCircleAvatar({
    Key? key,
    required this.url,
    this.radius = 10,
  }) : super(key: key);

  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: url,
          ),
        ),
      )
    );

  }

}