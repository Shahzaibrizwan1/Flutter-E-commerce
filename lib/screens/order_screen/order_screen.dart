import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_firestore_helper/firestorehelper.dart';
import 'package:ecomm_firebase/models/product_model.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:ecomm_firebase/screens/coustom_bottom_bar/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  final ProductModel product;
  const OrderScreen({super.key, required this.product});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedItem = 0;
  // final int _totalItems = 0;
  // final double _totalPrice = 0.0;

  // void _updateTotal() {
  //   setState(() {
  //     _totalItems = _selectedItem + 1;
  //     _totalPrice = (_selectedItem + 1) * 10.0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                // color: Colors.lightBlue,
                border: Border.all(width: 1.3, color: Colors.blueAccent),
              ),
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: _selectedItem,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value!;
                        // _updateTotal();
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.money),
                  ),
                  const Text('Pay Online'),
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                // color: Colors.lightBlue,
                border: Border.all(width: 1.3, color: Colors.blueAccent),
              ),
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedItem,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value!;
                        // _updateTotal();
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.money),
                  ),
                  const Text('Cash on Delivery'),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Row(
            //     children: [
            //       const Text('Total Items:'),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 16.0),
            //         child: Text('$_totalItems'),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Price:',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('\$${appProvider.totalprice()}'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  // appProvider.getbuyProductList.clear();
                  appProvider.addbuyProduct(widget.product);
                  bool value = await FirebaseFirestoreHelper.instance
                      .orderuploadProductFirebase(
                          appProvider.getbuyProductList,
                          context,
                          _selectedItem == 0
                              ? "Pay Online"
                              : "Cash on Delivery");
                  appProvider.getbuyProductList.clear();
                  if (value) {
                    Future.delayed(const Duration(seconds: 2), () {
                      Routes.instance.push(
                          widget: const CustomNaviagtionBar(),
                          context: context);
                    });
                  }
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
