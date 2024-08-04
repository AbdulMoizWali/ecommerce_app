import 'package:ecommerce_app/data/exceptions/firebase_auth_helper_exception.dart';
import 'package:ecommerce_app/helpers/firebase_auth_helper.dart';
import 'package:ecommerce_app/helpers/snackbar_helper.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/routes/route_path.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      nameController.text = 'Abdul Moiz';
      emailController.text = 'howtodo0147@gmail.com';
      passwordController.text = 'Qwerty1234';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(context),
          _registerPageBody(context),
        ],
      ),
    );
  }

  Positioned _registerPageBody(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 60,
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.getThemeColors(context).pureWhite,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 57,
                child: Image.asset(
                  ImageConstants.logoImage,
                  alignment: Alignment.centerLeft,
                ),
              ),
              vGap(15),
              const Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              vGap(5),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Reggie James',
                ),
              ),
              vGap(15),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              vGap(5),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Reggie James',
                ),
              ),
              vGap(15),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              vGap(5),
              TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '...........',
                  suffix: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      splashColor: ThemeColors.getThemeColors(context).white,
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 2,
                        ),
                        child: Text(
                          isPasswordVisible ? 'Hide' : 'Show',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              vGap(15),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuthHelper.signupWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                    );
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBarHelper.successSnackBar(
                          context, 'Signed up successfully'),
                    );
                    if (!context.mounted) return;
                    await signin(context);
                  } on FirebaseAuthHelperException catch (fe) {
                    if (!context.mounted) return;
                    if (fe.type ==
                        FirebaseAuthHelperExceptionType.emailAlreadyInUse) {
                      await signin(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarHelper.errorSnackBar(context, fe.message),
                      );
                    }
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              vGap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an Account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutePath.login);
                    },
                    child: const Text('Signin'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _background(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Container(
        color: ThemeColors.getThemeColors(context).primaryColor,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Text(
          'Copyright 2024',
          style: TextStyle(
            color: ThemeColors.getThemeColors(context).pureWhite,
          ),
        ),
      ),
    );
  }

  Future<void> signin(BuildContext context) async {
    try {
      await FirebaseAuthHelper.signinWithEmailAndPassword(
        emailController.text,
        passwordController.text,
        () {
          Navigator.pushReplacementNamed(context, RoutePath.home);
        },
      );
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarHelper.successSnackBar(context, 'Signed in successfully'),
      );
    } on FirebaseAuthHelperException catch (fe) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarHelper.errorSnackBar(context, fe.message),
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
