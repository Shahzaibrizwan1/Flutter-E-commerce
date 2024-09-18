import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_auth_helper/firebae_auth_helper.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_firestore_helper/firestorehelper.dart';
import 'package:ecomm_firebase/models/UserModel/user_model.dart';
import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:ecomm_firebase/screens/auth_ui/signup/signup.dart';
import 'package:ecomm_firebase/screens/editProfile/edit_Profile.dart';
import 'package:ecomm_firebase/screens/order_screen/order_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Account')),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  child: Column(
                children: [
                  appProvider.getUserInformation.image == null
                      ? const Icon(
                          Icons.person,
                          size: 59,
                        )
                      : ClipOval(
                          child: Image.network(
                            appProvider.getUserInformation.image!,
                            width: 140, // Double the radius
                            height: 140, // Double the radius
                            fit: BoxFit.cover,
                          ),
                        ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(appProvider.getUserInformation.name),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(appProvider.getUserInformation.email),
                  const SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Routes.instance.push(
                            widget: const EditProfile(), context: context);
                      },
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ))),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Routes.instance.push(
                            widget: const OrderScreen(), context: context);
                      },
                      leading: const Icon(Icons.shopping_bag_outlined),
                      title: const Text("Your Order"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite),
                      title: const Text("Fovorite"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.description),
                      title: const Text("About us"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.help),
                      title: const Text("Support"),
                    ),
                    ListTile(
                      onTap: () {
                        FirebaseAuthHelper.instance.Logout(context);
                        setState(() {});
                        Routes.instance
                            .push(widget: const SignUp(), context: context);
                      },
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text("Logout"),
                    ),
                    const Center(
                        child: Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Colors.black),
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
