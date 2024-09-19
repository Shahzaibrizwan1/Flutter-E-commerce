import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_firebase/firebase_helper/Firebase_storage_helper/firebase_storage_helper.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_firestore_helper/firestorehelper.dart';
import 'package:ecomm_firebase/models/UserModel/user_model.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider with ChangeNotifier {
  // Declare a list of ProductModel to store the cart items
  final List<ProductModel> _cartList = [];
  // Declare a UserModel to store the user information
  UserModel? _userModel;
  // Getter to return the user information
  UserModel get getUserInformation => _userModel!;

  //*  cart screen add  function
  // Function to add a product to the cart
  void addProduct(ProductModel productmodel) {
    _cartList.add(productmodel);
    notifyListeners();
  }

  // Function to remove a product from the cart
  void removeProduct(ProductModel productmodel) {
    _cartList.remove(productmodel);

    notifyListeners();
  }

  // Getter to return the cart list
  List<ProductModel> get cartList => _cartList;

//* favourite cart screen  function
  // Declare a list of ProductModel to store the favorite items
  final List<ProductModel> _favoriteList = [];

  // Function to add a product to the favorite list
  void addfavouriteProduct(ProductModel productmodel) {
    _favoriteList.add(productmodel);
    notifyListeners();
  }

  // Function to remove a product from the favorite list
  void removeFavouriteProduct(ProductModel productmodel) {
    _favoriteList.remove(productmodel);

    notifyListeners();
  }

  // Function to get the user information from the Firebase Firestore
  void userinfo() async {
    _userModel = await FirebaseFirestoreHelper.instance.getuserdetails();
    notifyListeners();
  }

  // Getter to return the favorite list
  List<ProductModel> get FavouriteList => _favoriteList;

  /// This function is used to update the user information in the Firebase Firestore.
  ///
  /// If the [file] parameter is null, it will only update the user information without changing the profile image.
  ///
  /// If the [file] parameter is not null, it will update the user information and the profile image. The profile image
  /// will be uploaded to the Firebase Storage and the download URL will be saved in the user information.
  ///
  /// After updating the user information, it will call the [notifyListeners] function to notify the widgets that are
  /// listening to the changes.
  void updateuserinfoFirebase(UserModel usermodel, File? file) async {
    log("ncjfncjfcnfjcn");
    if (file == null) {
      _userModel = usermodel;
      FirebaseFirestore.instance
          .collection("User")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
    } else {
      String imageurl =
          await FirebaseStorageHelper.instance.uploadUserImage(file);
      _userModel = usermodel.copyWith(image: imageurl);
      FirebaseFirestore.instance
          .collection("User")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
    }
    notifyListeners();
  }

  double totalprice() {
    double totalprice = 0.0;
    for (var element in _cartList) {
      totalprice += element.price * element.qty!;
    }
    return totalprice;
  }

  /// This function is used to update the quantity of a product in the cart list.
  ///
  /// It takes a [ProductModel] and an integer [qty] as parameters.
  ///
  /// It finds the index of the [ProductModel] in the [_cartList] and updates the quantity of the product at that index.
  ///
  /// After updating the quantity, it calls the [notifyListeners] function to notify the widgets that are listening to the changes.
// It finds the index of the product in the _cartList, updates the quantity at that index, and then notifies any listeners that the data has changed.
  void updateqty(ProductModel productmodel, int qty) {
    int index = _cartList.indexOf(productmodel);
    _cartList[index].qty = qty;
    notifyListeners();
  }
}
