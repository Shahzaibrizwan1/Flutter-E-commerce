import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String image;
  String name;

  Product({
    required this.id,
    required this.image,
    required this.name,
  });

  //* Convert JSON (Map<String, dynamic>) to Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
    );
  }
  //* Convert Product object to JSON (Map<String, dynamic>)This can be useful when you need to send data back to Firestore.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

  static fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
