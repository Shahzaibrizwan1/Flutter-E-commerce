import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String? image;
  String name;
  String email;
  String phone;

  UserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
  });

  //* Convert JSON (Map<String, dynamic>) to UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
  //* Convert UserModel object to JSON (Map<String, dynamic>)This can be useful when you need to send data back to Firestore.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  static fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
