import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Models
import 'package:asdshop/app/models/product.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

// Widgets
import 'product_detail.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: true,          
          builder: (_) => ProductDetaild(product: product)
        );
      },
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 20),
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
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: AsdTheme.border
                    )
                  ),
                  child: (product.imgs.isNotEmpty) ? ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      imageUrl: product.imgs.first,
                    ),
                  ) : const SizedBox.shrink(),
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
                      const SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          '\$ ${product.price}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AsdTheme.styleTitle.copyWith(
                            fontSize: _responsive.ip(1.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: AsdTheme.primaryColor,
                radius: _responsive.wp(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        '${product.stock}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AsdTheme.styleText.copyWith(
                          fontSize: _responsive.ip(1.2),
                          color: Colors.white
                        ),
                      )
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );

  }

}