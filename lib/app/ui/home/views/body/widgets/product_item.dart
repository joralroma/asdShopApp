import 'package:flutter/material.dart';

// Models
import 'package:asdshop/app/models/product.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      width: double.infinity,
      height: 140,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: AsdTheme.border
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                color: AsdTheme.border
              )
            ),            
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AsdTheme.styleTitle.copyWith(
                      fontSize: _responsive.ip(1.8)
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: Text(
                    product.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AsdTheme.styleText.copyWith(
                      fontSize: _responsive.ip(1.6),
                      fontFamily: 'OpenSasSemiBold'
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }

}