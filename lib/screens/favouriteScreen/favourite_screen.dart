import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:ecomm_firebase/screens/widgets/fovourite_Screen_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
                itemCount: appProvider.FavouriteList.length,
                itemBuilder: (ctx, index) {
                  return FavouriteScreenItem(
                      product: appProvider.FavouriteList[index]);
                }));
  }
}
