import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({
    super.key,
    required this.onTap,
    required this.categorySelected,
    required this.themeColors,
    required this.category,
  });

  final VoidCallback onTap;
  final bool categorySelected;
  final ThemeColors themeColors;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          right: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              categorySelected ? themeColors.primaryColor : themeColors.white,
        ),
        child: Text(
          category.name,
          style: TextStyle(
            color: categorySelected ? themeColors.primaryVariantColor : null,
          ),
        ),
      ),
    );
  }
}