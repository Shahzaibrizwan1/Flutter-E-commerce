import 'package:ecomm_firebase/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider with ChangeNotifier {
  final List<ProductModel> _cartList = [];

  void addProduct(ProductModel productmodel) {
    _cartList.add(productmodel);
    notifyListeners();
  }

  void removeProduct(ProductModel productmodel) {
    _cartList.remove(productmodel);

    notifyListeners();
  }

  List<ProductModel> get cartList => _cartList;
}
