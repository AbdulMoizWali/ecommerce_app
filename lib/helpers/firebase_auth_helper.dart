import 'package:ecommerce_app/data/exceptions/firebase_auth_helper_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static Future<UserCredential?> signupWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw FirebaseAuthHelperException(
          'The password provided is too weak.',
          type: FirebaseAuthHelperExceptionType.weakPassword,
        );
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseAuthHelperException(
          'The account already exists for that email so signing in.',
          type: FirebaseAuthHelperExceptionType.emailAlreadyInUse,
        );
      } else {
        throw FirebaseAuthHelperException(e.code);
      }
    } catch (e) {
      throw Exception('Error occured $e');
    }
  }

  static Future<UserCredential?> signinWithEmailAndPassword(
    String email,
    String password,
    VoidCallback onSigningInCompleted,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSigningInCompleted();
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseAuthHelperException(
          'No user found for that email.',
          type: FirebaseAuthHelperExceptionType.userNotFound,
        );
      } else if (e.code == 'wrong-password') {
        throw FirebaseAuthHelperException(
          'Wrong password provided for that user.',
          type: FirebaseAuthHelperExceptionType.wrongPassword,
        );
      } else if (e.code == 'invalid-credential') {
        throw FirebaseAuthHelperException(
          'Invalid username or password provided',
          type: FirebaseAuthHelperExceptionType.wrongPassword,
        );
      } else {
        throw FirebaseAuthHelperException(e.code);
      }
    } catch (e) {
      throw Exception('Error occured $e');
    }
  }
}
