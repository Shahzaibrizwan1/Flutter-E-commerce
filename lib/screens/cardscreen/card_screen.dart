import 'package:ecomm_firebase/provider/app_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
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
