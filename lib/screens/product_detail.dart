import 'package:ecommerce_app/components/rating_bar.dart';
import 'package:ecommerce_app/components/rounded_color_selector/rounded_color_selector.dart';
import 'package:ecommerce_app/data/storage/products.dart';
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
  late int productIndex;

  Set<Color> availableColors = {
    Colors.purple,
    Colors.blue,
    Colors.black,
    Colors.grey,
  };
  late Color selectedColor;

  @override
  void initState() {
    productIndex = Products.getProductIndexById(widget.product.id);
    selectedColor = availableColors.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeColors = ThemeColors.getThemeColors(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.whiteSmoke,
        actions: [
          IconButton(
            isSelected: Products.PRODUCTS[productIndex].isFavorite,
            icon: const Icon(EvaIcons.heart_outline),
            selectedIcon: const Icon(EvaIcons.heart),
            onPressed: () {
              setState(() {
                Products.switchIsFavouriteValue(widget.product);
              });
            },
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
            Hero(
              tag: 'productDetail-${widget.product.name}-${widget.product.id}',
              child: Container(
                height: 300,
                width: 300,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            vGap(20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        widget.product.category,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      StarRating(
                        rating: widget.product.rating,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: themeColors.primaryColor,
                  ),
                ),
              ],
            ),
            vGap(15),
            const Text(
              'Color',
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            vGap(15),
            RoundedColorSelector(
              selectedColor: selectedColor,
              availableColors: availableColors,
              onColorChange: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),
            vGap(15),
            const Text(
              'About',
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            vGap(15),
            Text(widget.product.details),
            vGap(15),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
