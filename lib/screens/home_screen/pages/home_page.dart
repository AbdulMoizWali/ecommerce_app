import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/routes/route_path.dart';
import 'package:ecommerce_app/screens/home_screen/components/category_list_card.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [
    CategoryModel(name: 'All'),
    CategoryModel(name: 'Electronic'),
    CategoryModel(name: 'Fashion'),
    CategoryModel(name: 'Shoes'),
    CategoryModel(name: 'Furniture'),
  ];

  List<ProductModel> popularProducts = [
    ProductModel(
      category: 'Leather Women Bag',
      name: 'Leather Women Bag',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: Image.asset(ImageConstants.productImage1),
      totalReviews: 715,
    ),
    ProductModel(
      category: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: Image.asset(ImageConstants.productImage2),
      totalReviews: 379,
    ),
  ];

  List<ProductModel> latestProducts = [
    ProductModel(
      category: 'Leather Women Bag',
      name: 'Leather Women Bag',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: Image.asset(ImageConstants.productImage1),
      totalReviews: 715,
    ),
    ProductModel(
      category: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: Image.asset(ImageConstants.productImage2),
      totalReviews: 379,
    ),
  ];

  late ThemeColors themeColors;
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    themeColors = ThemeColors.getThemeColors(context);
    return Scaffold(
      backgroundColor: themeColors.whiteSmoke,
      appBar: AppBar(
        backgroundColor: themeColors.whiteSmoke,
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
            _popularProductList(),
            _latestProductHeading(),
            _latestProductList(),
          ],
        ),
      ),
    );
  }

  SliverList _latestProductList() {
    return SliverList.builder(
      itemCount: latestProducts.length,
      itemBuilder: (context, index) {
        ProductModel product = latestProducts[index];
        return Card(
          elevation: 0,
          color: themeColors.pureWhite,
          child: ListTile(
            leading: product.image,
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
      },
    );
  }

  SliverToBoxAdapter _latestProductHeading() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Latest Products'),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            vGap(5),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _popularProductList() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Popular Products'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePath.popularProductScreen);
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            vGap(5),
            SizedBox(
              height: 264,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: popularProducts.length,
                itemBuilder: (context, index) {
                  ProductModel product = popularProducts[index];
                  return ProductCard(
                    product: product,
                  );
                },
              ),
            )
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
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePath.categoryScreen);
                  },
                  child: const Text('See All'),
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
