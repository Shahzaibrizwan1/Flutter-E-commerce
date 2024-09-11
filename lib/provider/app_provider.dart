import 'package:ecomm_firebase/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider with ChangeNotifier {
  final List<ProductModel> _cartList = [];

  //*  cart screen add  function
  void addProduct(ProductModel productmodel) {
    _cartList.add(productmodel);

    notifyListeners();
  }

  void removeProduct(ProductModel productmodel) {
    _cartList.remove(productmodel);

    notifyListeners();
  }

  List<ProductModel> get cartList => _cartList;

//* favourite cart screen  function
  final List<ProductModel> _favoriteList = [];

  void addfavouriteProduct(ProductModel productmodel) {
    _favoriteList.add(productmodel);
    notifyListeners();
  }

  void removeFavouriteProduct(ProductModel productmodel) {
    _favoriteList.remove(productmodel);

    notifyListeners();
  }

  List<ProductModel> get FavouriteList => _favoriteList;
}
