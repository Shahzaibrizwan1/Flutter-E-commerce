import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_firestore_helper/firestorehelper.dart';
import 'package:ecomm_firebase/models/catagory%20Model/catagories.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:ecomm_firebase/screens/home/home.dart';
import 'package:flutter/material.dart';

class CatagoryViewModel extends StatefulWidget {
  final Product products;
  const CatagoryViewModel({super.key, required this.products});

  @override
  State<CatagoryViewModel> createState() => _CatagoryViewModelState();
}

class _CatagoryViewModelState extends State<CatagoryViewModel> {
  List<ProductModel> productcatagorieslist = [];
  void getcatagoriesview() async {
    if (widget.products.id.isEmpty) {
      print("Error: Product ID is empty.");
      return;
    }
    print("Fetching products for ID: ${widget.products.id}");
    setState(() {
      isloading = true;
    });
    productcatagorieslist = await FirebaseFirestoreHelper.instance
        .CatagoriesView(widget.products.id);
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    getcatagoriesview();
    super.initState();
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catagory view'),
      ),
      body: isloading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  productcatagorieslist.isEmpty
                      ? const Center(
                          child: Text("Catagories is Empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            widget.products.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productcatagorieslist.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final product = productcatagorieslist[index];
                      return ProductCard(
                        imageUrl: productcatagorieslist[index].image,
                        name: productcatagorieslist[index].name,
                        price: productcatagorieslist[index].price,
                        product: product,
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
