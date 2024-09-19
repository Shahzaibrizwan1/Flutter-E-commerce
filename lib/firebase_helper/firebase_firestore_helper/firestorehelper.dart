import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/models/UserModel/user_model.dart';
import 'package:ecomm_firebase/models/catagory%20Model/catagories.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseFirestoreHelper {
  // Create an instance of the class
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();

  // Create an instance of the Firestore database
  final FirebaseFirestore _firestorefirestore = FirebaseFirestore.instance;
  // Get all categories from the database
  Future<List<Product>> getCategories() async {
    try {
      // Get the documents from the "Catagories" collection
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestorefirestore.collection("Catagories").get();
      // Map the documents to a list of Product objects
      List<Product> catagories =
          querySnapshot.docs.map((e) => Product.fromJson(e.data())).toList();
      // return Product.fromSnapshot(doc);

      return catagories;
    } catch (e) {
      print("Error getting documents: $e");
      showMessage(e.toString());
    }
    return [];
  }

  // Get all top stories from the database
  Future<List<ProductModel>> TopStories() async {
    try {
      // Get the documents from the "Products" collection group
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestorefirestore.collectionGroup("Products").get();

      // Map the documents to a list of ProductModel objects
      List<ProductModel> productcatagories = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      // return Product.fromSnapshot(doc);

      return productcatagories;
    } catch (e) {
      print("Error getting documents: $e");
      showMessage(e.toString());
    }
    return [];
  }

  // Get all products from a specific category
  Future<List<ProductModel>> CatagoriesView(String id) async {
    try {
      // Get the documents from the "Products" collection in the "Catagories" document
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestorefirestore
              .collection("Catagories")
              .doc(id)
              .collection("Products")
              .get();

      // Map the documents to a list of ProductModel objects
      List<ProductModel> productcatagories = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      // return Product.fromSnapshot(doc);
      print("Fetched products: $productcatagories");
      return productcatagories;
    } catch (e) {
      print("Error getting documents: $e");
      showMessage(e.toString());
    }
    return [];
  }

  // Get the user details from the database
  Future<UserModel> getuserdetails() async {
    // QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestorefirestore.collection("Users").doc(userId).get();
    // Get the document from the "Users" collection with the current user's ID
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firestorefirestore
            .collection("User")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

    // Map the document to a UserModel object
    return UserModel.fromJson(querySnapshot.data()!);
  }

  /// Uploads the order to the database
  ///
  /// This function takes a list of ProductModel objects and uploads them to the
  /// "UserOrder" collection in the Firestore database. It will also calculate
  /// the total price of all the products in the list and add it to the document.
  ///
  /// If there is an error, it will return false. Otherwise, it will return true.
  Future<bool> orderuploadProductFirebase(
      List<ProductModel> list, context, String payment) async {
    try {
      showLoadingDialog(context);
      double totalPrice = 0.0;
      for (var element in list) {
        totalPrice += element.price * element.qty!;
      }
      DocumentReference documentReference = _firestorefirestore
          .collection("UserOrder")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Order")
          .doc();
      documentReference.set({
        "Products": list.map((e) => e.toJson()),
        "status": "pending",
        "totalPrice": totalPrice,
        "payment": payment,
      });
      Navigator.of(context, rootNavigator: true).pop();
      showMessage("Order Place Successfully");
      return true;
    } catch (e) {
      showMessage(e.toString());
      Navigator.of(context, rootNavigator: true).pop();

      return false;
    }
  }
}
