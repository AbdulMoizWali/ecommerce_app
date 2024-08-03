import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/*
try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                            Navigator.pushReplacementNamed(
                                context, RoutePath.home);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }*/

class FirebaseAuthHelper {
  static Future<UserCredential?> loginWithEmailAndPassword(
    String email,
    String password,
    VoidCallback onLoggedInCompleted,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onLoggedInCompleted();
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.code);
      }
    } catch (e) {
      print('Error occured $e');
    }
    return null;
  }
}
