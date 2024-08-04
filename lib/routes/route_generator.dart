import 'package:ecommerce_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/routes/route_path.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/screens/home_screen_2.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case RoutePath.registration:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());

      case RoutePath.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RoutePath.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
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
