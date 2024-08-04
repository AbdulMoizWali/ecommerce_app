import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/screens/home_screen/components/category_list_card.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [
    CategoryModel(name: 'All'),
    CategoryModel(name: 'Electronic'),
    CategoryModel(name: 'Fashion'),
    CategoryModel(name: 'Shoes'),
    CategoryModel(name: 'Furniture'),
  ];
  late ThemeColors themeColors;
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    themeColors = ThemeColors.getThemeColors(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            _featuredProductSection(context),
            _categoryList(),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _categoryList() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Category'),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),
            vGap(5),
            SizedBox(
              height: 30,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return CategoryListCard(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    categorySelected: selectedCategory == index,
                    themeColors: themeColors,
                    category: category,
                  );
                },
              ),
            )
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
                  color: themeColors.primaryVariantColor,
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
