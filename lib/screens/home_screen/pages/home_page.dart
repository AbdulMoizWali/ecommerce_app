import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/data/storage/categories.dart';
import 'package:ecommerce_app/data/storage/products.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/routes/route_path.dart';
import 'package:ecommerce_app/screens/home_screen/components/category_list_card.dart';
import 'package:ecommerce_app/screens/home_screen/components/latest_product_card.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeColors themeColors;
  CategoryModel selectedCategory = CATEGORIES[0];
  List<ProductModel> get popularProducts {
    var popularList = Products.PRODUCTS;
    popularList.sort((a, b) => b.viewCount.compareTo(a.viewCount));
    return popularList.sublist(0, 4);
  }

  late List<ProductModel> latestProducts;

  @override
  void initState() {
    super.initState();

    latestProducts = Products.PRODUCTS;
    latestProducts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    latestProducts = latestProducts.where((product) {
      var isInPoPularProducts = popularProducts.contains(product) == true;
      return !isInPoPularProducts;
    }).toList();
  }

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
          clipBehavior: Clip.none,
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
        return LatestProductCard(product: product);
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Popular Products'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RoutePath.popularProductScreen);
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            vGap(5),
            SizedBox(
              height: 264,
              child: ListView.builder(
                clipBehavior: Clip.none,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: popularProducts.length,
                itemBuilder: (context, index) {
                  ProductModel product = popularProducts[index];
                  return ProductCard(
                    isFavourite: product.isFavorite,
                    product: product,
                    onFavoriteTap: (isFavourite) {
                      setState(() {
                        Products.switchIsFavouriteValue(product);
                        // print('isFavourite: $isFavourite');
                      });
                    },
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
    var topCategories = CATEGORIES.sublist(0, 5);
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
                itemCount: topCategories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = topCategories[index];
                  return CategoryListCard(
                    onTap: () {
                      setState(() {
                        selectedCategory = CATEGORIES[index];
                      });
                    },
                    categorySelected: selectedCategory == category,
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
