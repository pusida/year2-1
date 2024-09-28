import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/screen/home_screen.dart';
import 'package:flutter_expense_tracker/screen/login_screen.dart';
import 'package:flutter_expense_tracker/services/db.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  var db = Db();
  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      await db.addUser(data, context);

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = 'An error occurred. Please try again.';
      }

      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: white,
        textColor: mainFontColor,
        fontSize: 16.0,
      );
    } catch (e) {}
  }

  login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'too-many-requests') {
        message = 'Please wait and try again later.';
      } else {
        message = 'An error occurred. Please try again.';
      }

      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: white,
        textColor: mainFontColor,
        fontSize: 16.0,
      );
    } catch (e) {}
  }
}
