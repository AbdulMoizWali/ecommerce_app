import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/routes/route_path.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LatestProductCard extends StatelessWidget {
  const LatestProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors.getThemeColors(context);
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      shadowColor: Colors.grey.shade200,
      surfaceTintColor: Colors.grey.shade100,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      color: themeColors.pureWhite,
      child: ListTile(
        splashColor: themeColors.primaryColor.withOpacity(0.1),
        onTap: () => Navigator.pushNamed(
          context,
          RoutePath.productDetailScreen,
          arguments: product,
        ),
        leading: Hero(
          tag: 'productDetail-${product.name}-${product.id}',
          child: Image.asset(product.image),
        ),
        title: Text(product.name),
        subtitle: Text('\$${product.price}'),
        subtitleTextStyle: TextStyle(
          color: themeColors.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '(${product.totalReviews.toStringAsFixed(0)})',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            hGap(5),
            const Icon(
              EvaIcons.star,
              color: Colors.yellow,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
