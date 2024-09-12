import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:ecomm_firebase/screens/cardscreen/card_screen.dart';
import 'package:ecomm_firebase/screens/favouriteScreen/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductDescriptionScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDescriptionScreen({super.key, required this.product});

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.blueAccent,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.product.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        // Add your favourite action here
                        setState(() {
                          widget.product.isFavourite =
                              !widget.product.isFavourite;
                          if (widget.product.isFavourite) {
                            appProvider.addfavouriteProduct(widget.product);
                          } else {
                            appProvider.removeFavouriteProduct(widget.product);
                          }
                          //showMessage("Remove Favourite");
                        });
                      },
                      icon: Icon(widget.product.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border))
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.price,
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
              const SizedBox(height: 16),
              Text(
                widget.product.description,
                style: const TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        qty--;
                        print("$qty");
                      });
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(qty.toString()),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      setState(() {
                        qty++;
                        print("$qty");
                      });
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        ProductModel productmodel =
                            widget.product.copyWith(qty: qty);
                        appProvider.addProduct(productmodel);
                        Routes.instance
                            .push(widget: const CardScreen(), context: context);
                        showMessage("Added To Cart");
                      },
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Routes.instance.push(
                          widget: const FavouriteScreen(), context: context);
                      // Add your buy action here
                    },
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
