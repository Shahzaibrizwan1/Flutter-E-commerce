import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCardScreen extends StatefulWidget {
  final ProductModel product;
  const SingleCardScreen({super.key, required this.product});

  @override
  State<SingleCardScreen> createState() => _SingleCardScreenState();
}

class _SingleCardScreenState extends State<SingleCardScreen> {
  int qty = 1;
  @override
  void initState() {
    qty = widget.product.qty ?? 1;
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
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
                            Text("\$${widget.product.price.toString()}",
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (qty >= 1) qty--;
                                print("$qty");
                              });
                              appProvider.updateqty(widget.product, qty);
                            },
                            child: const CircleAvatar(
                              radius: 15,
                              child: Icon(Icons.remove),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$qty.",
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                qty++;
                                print("$qty");
                              });
                              appProvider.updateqty(widget.product, qty);
                            },
                            child: const CircleAvatar(
                              radius: 15,
                              child: Icon(Icons.add),
                            ),
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          IconButton(
                            onPressed: () {
                              final appProvider = Provider.of<AppProvider>(
                                  context,
                                  listen: false);

                              appProvider.removeProduct(widget.product);
                              showMessage("Removed from cart");
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                      CupertinoButton(
                          onPressed: () {
                            final appProvider = Provider.of<AppProvider>(
                                context,
                                listen: false);

                            if (!widget.product.isFavourite) {
                              appProvider
                                  .removeFavouriteProduct(widget.product);
                              showMessage("Removed from Wishlist");
                            } else {
                              appProvider.addfavouriteProduct(widget.product);
                              showMessage("Added to Wishlist");
                            }
                          },
                          child: Text(
                            !widget.product.isFavourite
                                ? "Remove from Wishlist"
                                : "Add To Wishlist",
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
