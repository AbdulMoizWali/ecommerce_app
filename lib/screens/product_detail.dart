import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    var themeColors = ThemeColors.getThemeColors(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.whiteSmoke,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(EvaIcons.heart_outline),
          ),
        ],
        title: const Text(
          'Product Detail',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(widget.product.image),
            ),
            vGap(10),
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 21,
              ),
            ),
            Text(
              widget.product.category ?? "",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
