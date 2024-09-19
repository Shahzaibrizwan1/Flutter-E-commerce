import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:ecomm_firebase/screens/favouriteScreen/favourite_screen.dart';
import 'package:ecomm_firebase/screens/order_screen/order_screen.dart';
import 'package:ecomm_firebase/screens/widgets/single_card_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final int _selectedItem = 0;
  final int _totalItems = 0;
  final double _totalPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    const Text('Total Price:'),
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
                  onPressed: () {
                    Routes.instance.push(
                        widget: const FavouriteScreen(), context: context);
                  },
                  child: const Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: appProvider.cartList.isEmpty
          ? const Center(child: Text("Cart is Empty"))
          : ListView.builder(
              itemCount: appProvider.cartList.length,
              itemBuilder: (ctx, index) {
                return SingleCardScreen(product: appProvider.cartList[index]);
              },
            ),
    );
  }
}
