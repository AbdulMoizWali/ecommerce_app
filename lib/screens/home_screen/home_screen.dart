import 'package:ecommerce_app/screens/home_screen/pages/favourite_page.dart';
import 'package:ecommerce_app/screens/home_screen/pages/home_page.dart';
import 'package:ecommerce_app/screens/home_screen/pages/profile_page.dart';
import 'package:ecommerce_app/screens/home_screen/pages/shopping_cart_page.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currectSelectedPage = 0;
  late ThemeColors themeColors;
  var pages = [
    const HomePage(),
    const FavouritePage(),
    const ShoppingCartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    themeColors = ThemeColors.getThemeColors(context);
    return Scaffold(
      backgroundColor: themeColors.whiteSmoke,
      body: pages[currectSelectedPage],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currectSelectedPage,
        onDestinationSelected: (value) {
          setState(() {
            currectSelectedPage = value;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        overlayColor: WidgetStateProperty.all(
          themeColors.primaryColor.withOpacity(0.1),
        ),
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(
              EvaIcons.home,
            ),
          ),
          NavigationDestination(
            label: 'Favourite',
            icon: Icon(
              EvaIcons.heart_outline,
            ),
          ),
          NavigationDestination(
            label: 'Cart',
            icon: Icon(
              EvaIcons.shopping_cart_outline,
            ),
          ),
          NavigationDestination(
            label: 'Profile',
            icon: Icon(
              EvaIcons.person_outline,
            ),
          ),
        ],
      ),
    );
  }
}
