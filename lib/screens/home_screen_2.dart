import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      companyName: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: ImageConstants.productImage,
      rating: 2,
    ),
    ProductModel(
      companyName: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: ImageConstants.productImage,
      rating: 2,
    ),
    ProductModel(
      companyName: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: ImageConstants.productImage,
      rating: 2,
    ),
    ProductModel(
      companyName: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: ImageConstants.productImage,
      rating: 2,
    ),
    ProductModel(
      companyName: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: ImageConstants.productImage,
      rating: 2,
    ),
    ProductModel(
      companyName: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: ImageConstants.productImage,
      rating: 2,
    ),
    ProductModel(
      companyName: 'Accu-check Active',
      name: 'Test Strip',
      details: '50 Strips in a box for Accu-check Active Glucometer Machine',
      price: 112,
      image: ImageConstants.productImage,
      rating: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    User currentUser = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(context, currentUser),
          _sliverContent(context),
          _sliverProductGrid(),
        ],
      ),
    );
  }

  SliverAppBar _sliverAppBar(BuildContext context, User currentUser) {
    return SliverAppBar(
      expandedHeight: 200.0,
      // floating: false,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: _searchBar(),
      ),
      forceMaterialTransparency: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background:
            _topSection(context, currentUser.displayName ?? currentUser.email!),
      ),
    );
  }

  SliverToBoxAdapter _sliverContent(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }

  SliverPadding _sliverProductGrid() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }

  Widget _topSection(BuildContext context, String userName) {
    return Stack(
      children: [
        Container(
          height: 230,
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
                'Hi, $userName',
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
        // Positioned(
        //   left: 20,
        //   right: 20,
        //   top: 190,
        //   child: _searchBar(),
        // ),
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.companyName,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    vGap(5),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    vGap(5),
                    Text(
                      'Rs. ${product.price.toInt()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    vGap(20),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 2,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFffc000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  hGap(2),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
