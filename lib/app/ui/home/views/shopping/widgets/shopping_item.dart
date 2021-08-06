import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Models
import 'package:asdshop/app/models/shopping.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';
import 'package:asdshop/app/utils/extencions.dart';

class ShoppingItem extends StatelessWidget {

  const ShoppingItem({
    Key? key,
    required this.shopping
  }) : super(key: key);

  final Shopping shopping;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 1
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),              
              border: Border.all(
                width: 1.5,
                color: AsdTheme.border
              ),
            ),
            child: (shopping.product!.imgs.isNotEmpty) ? ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: shopping.product!.imgs.first,
              ),
            ) : const SizedBox.shrink(),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  'Total: ${shopping.total}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AsdTheme.styleTitle.copyWith(
                    fontSize: _responsive.ip(1.8)
                  ),
                )
              ),
              const SizedBox(height: 10),
              Text(
                'Fecha: ${shopping.createdAt.toDateTime.toTimeCard}',
                style: AsdTheme.styleTitle.copyWith(
                  fontSize: _responsive.ip(1.8)
                ),
              )  
            ],
          )        
        ],
      ),
    );

  }

}