import 'package:ecomm_firebase/models/product_model.dart';
import 'package:ecomm_firebase/widgets/topTitles/toptitles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(55.0))),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: CatagoriesList.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 99, width: 99, child: Image.network(e)),
                      ),
                    ),
                  ).toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Top Stories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: BestProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: BestProducts[index].image,
                    name: BestProducts[index].name,
                    price: BestProducts[index].price,
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

// final List<Map<String, String>> products = [
//   {
//     'imageUrl': "https://img.lovepik.com/photo/45003/0454.jpg_wh860.jpg",
//     'name': 'Smartphone',
//     'price': '\$699'
//   },
//   {
//     'imageUrl':
//         "https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_640.png",
//     'name': 'Wireless Headset',
//     'price': '\$99'
//   },
//   {
//     'imageUrl':
//         "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
//     'name': 'iPhone 12',
//     'price': '\$999'
//   },
//   {
//     'imageUrl':
//         "https://cdn.pixabay.com/photo/2014/12/07/17/14/chicken-559892_640.png",
//     'name': 'MacBook Pro',
//     'price': '\$1299'
//   },
// ];

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
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
            height: 10,
          ),
          OutlinedButton(
              // style: const ButtonStyle(
              //   foregroundColor: WidgetStatePropertyAll(Colors.lightBlue),
              //   // foregroundColor: WidgetStatePropertyAll(Colors.lightBlue)
              // ),
              onPressed: () {},
              child: const Text("Buy Now"))
        ],
      ),
    );
  }
}

List<String> CatagoriesList = [
  "https://cdn.pixabay.com/photo/2014/12/07/17/14/chicken-559892_640.png",
  "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
  "https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616_640.png",
  "https://cdn.pixabay.com/photo/2014/12/21/23/24/spare-ribs-575310_640.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjxE-e7WnSGO8Ns6WdDYnVNYO7ecTkny51hA&s",
  "https://img.lovepik.com/photo/45003/0454.jpg_wh860.jpg"
];

List<ProductModel> BestProducts = [
  ProductModel(
      id: "1",
      name: "SmartPhone",
      image:
          "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
      description:
          "description nrlfnr fr fr frfrnfrnfrlfn kefnrfnr fekfnerkfeknfefec ekf e",
      price: "\$23",
      status: "Pending",
      isFavourite: false),
  ProductModel(
      id: "1",
      name: "SmartPhone",
      image:
          "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
      description:
          "description nrlfnr fr fr frfrnfrnfrlfn kefnrfnr fekfnerkfeknfefec ekf e",
      price: "\$24",
      status: "Pending",
      isFavourite: false),
  ProductModel(
      id: "1",
      name: "SmartPhone",
      image:
          "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
      description:
          "description nrlfnr fr fr frfrnfrnfrlfn kefnrfnr fekfnerkfeknfefec ekf e",
      price: "\$25",
      status: "Pending",
      isFavourite: false),
  ProductModel(
      id: "1",
      name: "SmartPhone",
      image:
          "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
      description:
          "description nrlfnr fr fr frfrnfrnfrlfn kefnrfnr fekfnerkfeknfefec ekf e",
      price: "\$26",
      status: "Pending",
      isFavourite: false),
  ProductModel(
      id: "1",
      name: "SmartPhone",
      image:
          "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
      description:
          "description nrlfnr fr fr frfrnfrnfrlfn kefnrfnr fekfnerkfeknfefec ekf e",
      price: "\$27",
      status: "Pending",
      isFavourite: false),
  ProductModel(
      id: "1",
      name: "SmartPhone",
      image:
          "https://cdn.pixabay.com/photo/2014/12/21/23/36/burgers-575655_1280.png",
      description:
          "description nrlfnr fr fr frfrnfrnfrlfn kefnrfnr fekfnerkfeknfefec ekf e",
      price: "\$28",
      status: "Pending",
      isFavourite: false),
];
