import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/data/storage/products.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class PopularProductScreen extends StatefulWidget {
  const PopularProductScreen({super.key});

  @override
  State<PopularProductScreen> createState() => _PopularProductScreenState();
}

class _PopularProductScreenState extends State<PopularProductScreen> {
  @override
  Widget build(BuildContext context) {
    var themeColors = ThemeColors.getThemeColors(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.whiteSmoke,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(EvaIcons.shopping_cart_outline),
          ),
        ],
        title: const Text(
          'Popular Product',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverGrid.builder(
              itemCount: Products.PRODUCTS.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                ProductModel product = Products.PRODUCTS[index];
                return ProductCard(
                  isFavourite: product.isFavorite,
                  product: product,
                  onFavoriteTap: (isFavourite) {
                    setState(() {
                      // print('isFavourite: $isFavourite');
                      Products.switchIsFavouriteValue(product);
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
