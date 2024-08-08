import 'package:ecommerce_app/data/storage/products.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/routes/route_path.dart';

import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

typedef OnFavoriteTap = void Function(bool isFavorite);

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.isFavourite,
    required this.product,
    required this.onFavoriteTap,
  });

  final bool isFavourite;
  final ProductModel product;
  final OnFavoriteTap? onFavoriteTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late ThemeColors themeColors;
  // bool isFavourite = false;

  // @override
  // void initState() {
  //   super.initState();
  //   isFavourite = widget.product.isFavorite;
  // }

  @override
  Widget build(BuildContext context) {
    themeColors = ThemeColors.getThemeColors(context);
    print(
        '${widget.product.id} : ${widget.product.name} : ${widget.product.isFavorite}');

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.productDetailScreen,
          arguments: widget.product,
        );
      },
      child: Container(
        height: 250,
        width: 170,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: themeColors.pureWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 5,
              color: Colors.grey.shade200,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UnconstrainedBox(
              alignment: Alignment.centerRight,
              child: IconButton(
                isSelected: widget.product.isFavorite,
                alignment: Alignment.center,
                onPressed: () {
                  // setState(
                  //   () {
                  //     isFavourite = !isFavourite;
                  //     Products.switchIsFavouriteValue(widget.product);
                  //   },
                  // );
                  widget.onFavoriteTap?.call(!widget.product.isFavorite);
                },
                selectedIcon: Icon(
                  HeroIcons.heart,
                  color: themeColors.red,
                ),
                style: IconButton.styleFrom(
                  iconSize: 20,
                ),
                icon: Icon(
                  HeroIcons.heart,
                  color: themeColors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag:
                        'productDetail-${widget.product.name}-${widget.product.id}',
                    child: SizedBox(
                      height: 120,
                      child: Image.asset(widget.product.image),
                    ),
                  ),
                  vGap(5),
                  Text(widget.product.name),
                  vGap(5),
                  Row(
                    children: [
                      const Icon(
                        EvaIcons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      hGap(5),
                      Text(
                        '(${widget.product.totalReviews.toStringAsFixed(0)} reviews)',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  vGap(5),
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: themeColors.primaryColor,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
