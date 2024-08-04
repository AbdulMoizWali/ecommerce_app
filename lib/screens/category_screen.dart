import 'package:ecommerce_app/components/category_card.dart';
import 'package:ecommerce_app/constants/icon_constants.dart';
import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late ThemeColors themeColors;
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(name: 'Bag', image: IconConstants.bag),
      CategoryModel(name: 'Watch', image: IconConstants.watch),
      CategoryModel(name: 'Shoes', image: IconConstants.shoes),
      CategoryModel(name: 'Jewelry', image: IconConstants.jewelry),
      CategoryModel(name: 'Sports', image: IconConstants.sports),
      CategoryModel(name: 'Music', image: IconConstants.music),
      CategoryModel(name: 'Gift', image: IconConstants.gift),
      CategoryModel(name: 'Plant', image: IconConstants.plant),
      CategoryModel(name: 'Phone', image: IconConstants.phone),
      CategoryModel(name: 'Furniture', image: IconConstants.furniture),
      CategoryModel(name: 'Cosmetics', image: IconConstants.cosmetic),
      CategoryModel(name: 'Hobby', image: IconConstants.hobby),
    ];
    themeColors = ThemeColors.getThemeColors(context);
    return Scaffold(
      backgroundColor: themeColors.whiteSmoke,
      appBar: AppBar(
        backgroundColor: themeColors.whiteSmoke,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
        title: const Text(
          'Category',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            _featuredProductSection(context),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              sliver: SliverGrid.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return CategoryCard(
                    category: category,
                    isSelected: selectedCategory == index,
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _featuredProductSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        clipBehavior: Clip.none,
        height: 160,
        decoration: BoxDecoration(
          color: themeColors.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: themeColors.pureWhite,
                  fontWeight: FontWeight.bold,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nike Air Max 270',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      'Men’s shoes',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    vGap(20),
                    const Text(
                      '\$290.00',
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: -40,
              child: Image.asset(ImageConstants.homeProductImage),
            ),
          ],
        ),
      ),
    );
  }
}