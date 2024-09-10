import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String name;
  String image;
  String description;
  String price;
  String status;
  bool isFavourite;
  int? qty;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.status,
    required this.isFavourite,
    this.qty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        description: json["description"] ?? '',
        price: json["price"] ?? '',
        status: json["status"] ?? '',
        qty: json["qty"] ?? 0,
        isFavourite: json["isFavourite"] ?? false,
        // isFavourite: json["isFavourite"] == false,
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "status": status,
        "isFavourite": !isFavourite,
        "qty": qty
      };

  @override
  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
          id: id,
          name: name,
          image: image,
          description: description,
          price: price,
          status: status,
          isFavourite: !isFavourite,
          qty: qty ?? this.qty);
}
