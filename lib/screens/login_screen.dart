import 'package:ecommerce_app/data/exceptions/firebase_auth_helper_exception.dart';
import 'package:ecommerce_app/helpers/firebase_auth_helper.dart';
import 'package:ecommerce_app/helpers/snackbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/helpers/gap.dart';
import 'package:ecommerce_app/routes/route_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      emailController.text = 'howtodog0147@gmail.com';
      passwordController.text = 'Qwerty1234';
      signin(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    ImageConstants.logoImage,
                  ),
                ),
              ),
              Text(
                'Quick Medical',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
              vGap(40),
              const Text('Please Enter your Mobile Number to Login/Signup'),
              vGap(10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              vGap(10),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Passoword',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              vGap(10),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuthHelper.signupWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
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
                child: const Text('Continue'),
              ),
            ],
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


/*
try {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);

                    Navigator.pushReplacementNamed(context, RoutePath.home);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Password is too weak'),
                              content:
                                  const Text('Please enter a strong password'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          });
                      // print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        Navigator.pushReplacementNamed(context, RoutePath.home);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'An error occured. Please try again later'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                    print(e);
                  }
*/

/*
FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  )
                      .then(
                    (userCredential) {
                      FirebaseAuthHelper.loginWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                        () {
                          Navigator.pushReplacementNamed(
                              context, RoutePath.home);
                        },
                      );
                    },
                  ).catchError(
                    (error) {
                      if (error is FirebaseAuthException) {
                        if (error.code == 'weak-password') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Password is too weak'),
                                  content: const Text(
                                      'Please enter a strong password'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        } else if (error.code == 'email-already-in-use') {
                          FirebaseAuthHelper.loginWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                            () {
                              Navigator.pushReplacementNamed(
                                  context, RoutePath.home);
                            },
                          );
                          print('The account already exists for that email.');
                        }
                        print(error.code);
                      }
                    },
                  );
*/