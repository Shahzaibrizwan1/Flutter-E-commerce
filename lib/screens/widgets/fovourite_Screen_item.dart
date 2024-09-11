import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/models/catagory%20Model/catagories.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreenItem extends StatefulWidget {
  final ProductModel product;
  const FavouriteScreenItem({super.key, required this.product});

  @override
  State<FavouriteScreenItem> createState() => _FavouriteScreenItemState();
}

class _FavouriteScreenItemState extends State<FavouriteScreenItem> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(
      context,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        // padding: const EdgeInsets.all(16),
        height: 140,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          // color: Colors.lightBlue,
          border: Border.all(width: 1.3, color: Colors.blueAccent),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Image.network(widget.product.image),

                  // decoration: const BoxDecoration(color: Colors.black),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text("\$${widget.product.price}",
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     appProvider.removeProduct(widget.product);
                          //     showMessage("Removed from cart");
                          //   },
                          //   icon: const Icon(Icons.delete),
                          // )
                        ],
                      ),
                      CupertinoButton(
                          onPressed: () {
                            appProvider.removeFavouriteProduct(widget.product);
                          },
                          child: const Text("Remove from Whislist")),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
