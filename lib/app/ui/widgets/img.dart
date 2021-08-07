import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AsdImg extends StatelessWidget {

  const AsdImg({
    Key? key,
    required this.url,
    this.radius = 5.0
  }) : super(key: key);

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        imageUrl: url,
      ),
    );

  }

}