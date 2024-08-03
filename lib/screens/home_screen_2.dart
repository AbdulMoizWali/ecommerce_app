import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [
    CategoryModel(name: 'Dental', color: Colors.pink),
    CategoryModel(name: 'Wellness', color: Colors.green),
    CategoryModel(name: 'Homeo', color: Colors.orange.shade600),
    CategoryModel(name: 'Eye care', color: Colors.blue),
  ];

  List<ProductModel> products = [
    ProductModel(
      name: 'Product 1',
      details: 'Product 1 details',
      price: 100,
      image: ImageConstants.productImage,
      rating: 4.5,
    ),
    ProductModel(
      name: 'Product 2',
      details: 'Product 2 details',
      price: 200,
      image: ImageConstants.productImage,
      rating: 4.5,
    ),
    ProductModel(
      name: 'Product 3',
      details: 'Product 3 details',
      price: 300,
      image: ImageConstants.productImage,
      rating: 4.5,
    ),
    ProductModel(
      name: 'Product 4',
      details: 'Product 4 details',
      price: 400,
      image: ImageConstants.productImage,
      rating: 4.5,
    ),
    ProductModel(
      name: 'Product 5',
      details: 'Product 5 details',
      price: 500,
      image: ImageConstants.productImage,
      rating: 4.5,
    ),
    ProductModel(
      name: 'Product 6',
      details: 'Product 6 details',
      price: 600,
      image: ImageConstants.productImage,
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: _topSection(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _topCategoriesHeading(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: _topCategories(context),
                  ),
                  vGap(10),
                  Image.asset(
                    ImageConstants.offerImage,
                    fit: BoxFit.cover,
                  ),
                  _dealOfTheDayHeading(context),
                ],
              ),
            ),
          ),
          // AnimationLimiter(
          //   child: GridView.count(
          //     crossAxisCount: 2,
          //     children: List.generate(
          //       100,
          //       (int index) {
          //         return AnimationConfiguration.staggeredGrid(
          //           position: index,
          //           duration: const Duration(milliseconds: 375),
          //           columnCount: 2,
          //           child: ScaleAnimation(
          //             child: FadeInAnimation(
          //               child: ListView.builder(
          //                 itemCount: products.length,
          //                 itemBuilder: (context, index) {
          //                   return ProductCard(product: products[index]);
          //                 },
          //               ),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // SliverAnimatedGrid(
          //   itemBuilder: (context, index, animation) {
          //     print('Index: $index');
          //     return FadeTransition(
          //       opacity: Tween<double>(
          //         begin: 0,
          //         end: 1,
          //       ).animate(animation),
          //       child: Container(
          //         width: 50,
          //         height: 50,
          //         color: Colors.red,
          //       ),
          //     );
          //   },
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     childAspectRatio: 1,

          //     // mainAxisSpacing: controller.offset,
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _topSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
        ),
        Container(
          height: 220,
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          decoration: ShapeDecoration(
            color: ThemeColors.getThemeColors(context).primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -280,
          left: -206,
          child: CircleAvatar(
            radius: 206,
            backgroundColor:
                ThemeColors.getThemeColors(context).white.withOpacity(0.07),
          ),
        ),
        Positioned(
          left: 20,
          top: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Shahzeb',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ThemeColors.getThemeColors(context).white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Welcome to Quick Medical Store',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ThemeColors.getThemeColors(context).white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 190,
          child: _searchBar(),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Material(
      color: Colors.amber,
      elevation: 2,
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Search Medicine & Health Products',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w100,
          ),
          prefixIcon: Icon(
            Iconsax.search_normal_1_outline,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Row _topCategoriesHeading(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Categories',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('View All'),
        ),
      ],
    );
  }

  Widget _topCategories(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 130,
      // clipBehavior: Clip.hardEdge,
      // decoration: BoxDecoration(),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 81,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(55),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        transform: const GradientRotation(3.14 / 4),
                        colors: [
                          category.color.withOpacity(0.5),
                          category.color,
                        ],
                      ),
                    ),
                  ),
                  vGap(5),
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Row _dealOfTheDayHeading(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Deals of the Day',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('More'),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFf6f6f8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(ImageConstants.productImage),
            ),
          ),
          vGap(5),
          Text(
            product.name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
          ),
          vGap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs. 100',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.heart_outline),
              ),
            ],
          ),
          Text(
            'Rating: ${product.rating}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
