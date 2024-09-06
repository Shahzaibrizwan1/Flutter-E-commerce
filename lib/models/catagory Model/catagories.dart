import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productId;
  String image;

  Product({
    required this.productId,
    required this.image,
  });

  //* Convert JSON (Map<String, dynamic>) to Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] ?? '',
      image: json['image'] ?? '',
    );
  }
  //* Convert Product object to JSON (Map<String, dynamic>)This can be useful when you need to send data back to Firestore.
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'image': image,
    };
  }

  static fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
