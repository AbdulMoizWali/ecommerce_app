import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeColors = ThemeColors.getThemeColors(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? themeColors.primaryColor : themeColors.pureWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? themeColors.primaryVariantColor
                    : themeColors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: category.image != null
                    ? ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? themeColors.pureWhite
                              : Colors.transparent,
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          category.image ?? "",
                        ),
                      )
                    : null,
              ),
            ),
            const Spacer(),
            Text(
              category.name,
              style: TextStyle(
                color: isSelected ? themeColors.pureWhite : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
