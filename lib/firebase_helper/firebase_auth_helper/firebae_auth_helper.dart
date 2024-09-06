// ignore_for_file: avoid_print

import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final Firestore _fetch = Firestore.instance;
  //* Notifies about changes to the user's sign-in state (such as sign-in or sign-out)
  Stream<User?> get getauthChanges => _auth.authStateChanges();
//* Build Context is time use for loading
  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      print("Showing loading dialog...");
      showLoadingDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      print("Login successful");
      return true;
//* Generic exception related to Firebase Authentication. Check the error code and message for more details.
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      print('Login error: ${error.code}');
      String errorMessage = getMessageFromErrorCode(error.code);
      print('Error message: $errorMessage'); // Debugging line
      showMessage(errorMessage); //

      // showMessage(error.code.toString());

      return false;
    }
  }

  Future<bool> CreatesAccount(String email, String password, String name,
      String phone, BuildContext context) async {
    try {
      // print("Showing loading dialog...");
      showLoadingDialog(context);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
      // print("Login successful");
      return true;
//* Generic exception related to Firebase Authentication. Check the error code and message for more details.
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      // print('Login error: ${error.code}');
      String errorMessage = getMessageFromErrorCode(error.code);
      // print('Error message: $errorMessage'); // Debugging line
      showMessage(errorMessage); //

      return false;
    }
  }
}
