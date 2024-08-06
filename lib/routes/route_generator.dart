import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/category_screen.dart';
import 'package:ecommerce_app/screens/popular_product_screen.dart';
import 'package:ecommerce_app/screens/product_detail.dart';
import 'package:ecommerce_app/screens/registration_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/routes/route_path.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/screens/home_screen/home_screen.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print(settings.name);
    }
    switch (settings.name) {
      case RoutePath.registration:
        return slidePageRouteBuilder(const RegistrationScreen());

      case RoutePath.login:
        return slidePageRouteBuilder(const LoginScreen());

      case RoutePath.home:
        return slidePageRouteBuilder(const HomeScreen());

      case RoutePath.categoryScreen:
        return slidePageRouteBuilder(const CategoryScreen());

      case RoutePath.productDetailScreen:
        assert(settings.arguments is ProductModel);
        return pageRouteBuilder(
          ProductDetail(
            product: settings.arguments as ProductModel,
          ),
        );

      case RoutePath.popularProductScreen:
        return slidePageRouteBuilder(const PopularProductScreen());

      default:
        return slidePageRouteBuilder(const NotFoundScreen());
    }
  }

  //fade page route builder
  static PageRouteBuilder<dynamic> fadePageRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
    );
  }

  //slide page route builder
  static PageRouteBuilder<dynamic> slidePageRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
    );
  }

  //page route builder
  static PageRouteBuilder<dynamic> pageRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
