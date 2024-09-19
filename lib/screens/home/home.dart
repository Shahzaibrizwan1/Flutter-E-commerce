import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_firestore_helper/firestorehelper.dart';
import 'package:ecomm_firebase/models/catagory%20Model/catagories.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:ecomm_firebase/screens/catagoryview/catagory_view.dart';
import 'package:ecomm_firebase/screens/productdetails/product_details.dart';
import 'package:ecomm_firebase/widgets/topTitles/toptitles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> catagorieslist = [];
  List<ProductModel> productcatagorieslist = [];
  bool isloading = false;
  @override
  void initState() {
    getcatagorieslist();
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.userinfo();
    super.initState();
  }

  void getcatagorieslist() async {
    setState(() {
      isloading = true;
    });
    catagorieslist = await FirebaseFirestoreHelper.instance.getCategories();
    productcatagorieslist = await FirebaseFirestoreHelper.instance.TopStories();

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: TopTitles(
                            subtitle: "",
                            title: "E Commerce",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(55.0))),
                                hintText: "Search...."),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        catagorieslist.isEmpty
                            ? const Center(
                                child: Text("Catagoris is Empty"),
                              )
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: catagorieslist
                                      .map(
                                        (e) => Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CatagoryViewModel(
                                                                products: e,
                                                              )));
                                                },
                                                child: Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  margin:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                      height: 99,
                                                      width: 99,
                                                      child: Image.network(
                                                          e.image)),
                                                ),
                                              ),
                                              Text(e.name)
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                        productcatagorieslist.isEmpty
                            ? const Center(
                                child: Text("Top Stories is Empty"),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Top Stories",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                        const SizedBox(height: 10),
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
                              price:
                                  productcatagorieslist[index].price.toString(),
                              product: product,
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ));
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              // productcatagorieslist[index].image ?? 'default_image_url',
              height: 90,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.lightBlue
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton(

              // style: const ButtonStyle(
              //   foregroundColor: WidgetStatePropertyAll(Colors.lightBlue),
              //   // foregroundColor: WidgetStatePropertyAll(Colors.lightBlue)
              // ),
              onPressed: () {
                Routes.instance.push(
                    widget: ProductDescriptionScreen(product: product),
                    context: context);
              },
              child: const Text("Buy Now"))
        ],
      ),
    );
  }
}
