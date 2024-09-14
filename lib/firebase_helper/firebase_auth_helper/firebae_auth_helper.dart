// ignore_for_file: avoid_print

import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/models/UserModel/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // String UserId = userCredential.user!.uid;
      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          image: null,
          name: name,
          email: email,
          phone: phone);

      _firestore.collection("User").doc(userModel.id).set(userModel.toJson());
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

  // Logut Function
  // Future<bool> logout(BuildContext context) async {
  // try {
  //   await _auth.signOut();
  //   return true;
  // } on FirebaseAuthException catch (error) {
  //   // print('Logout error: ${error.code}');
  //   String errorMessage = getMessageFromErrorCode(error.code);
  //   // print('Error message: $errorMessage'); // Debugging line
  //   showMessage(errorMessage); //
  //   return false;
  // }
  Future<bool> Logout(BuildContext context) async {
    try {
      await _auth.signOut();
      print("Signout");
      return true;
    } on FirebaseAuthException catch (error) {
      String errorMessage = getMessageFromErrorCode(error.code);
      showMessage(errorMessage);
      return false;
    }
  }
}
