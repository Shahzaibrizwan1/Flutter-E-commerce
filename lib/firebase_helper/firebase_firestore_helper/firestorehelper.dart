import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/models/UserModel/user_model.dart';
import 'package:ecomm_firebase/models/catagory%20Model/catagories.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();

  final FirebaseFirestore _firestorefirestore = FirebaseFirestore.instance;
  Future<List<Product>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestorefirestore.collection("Catagories").get();

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

  Future<List<ProductModel>> TopStories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestorefirestore.collectionGroup("Products").get();

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

  Future<List<ProductModel>> CatagoriesView(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestorefirestore
              .collection("Catagories")
              .doc(id)
              .collection("Products")
              .get();

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

  Future<UserModel> getuserdetails() async {
    // QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestorefirestore.collection("Users").doc(userId).get();
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firestorefirestore
            .collection("User")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

    return UserModel.fromJson(querySnapshot.data()!);
  }
}
