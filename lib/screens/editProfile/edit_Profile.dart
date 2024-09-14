import 'dart:io';

import 'package:ecomm_firebase/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

TextEditingController textEditingController = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  // File? image;
  // void takeimage() async {
  //   XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (value != null) {
  //     setState(() {
  //       image = File(value.path);
  //     });
  //   }
  // }
  File? image;
  void takeImage() async {
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    takeImage();
                    // takeimage();
                  },
                  child: CircleAvatar(
                    radius: 30,
                    //  backgroundImage: const NetworkImage("profilePictureUrl"),
                    backgroundColor: Colors.grey[200],
                    child: image == null
                        ? const Icon(Icons.camera_alt)
                        : Image.file(image!),
                  ),
                ),
              ),
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: appProvider.getUserInformation.name),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              Text(
                appProvider.getUserInformation.email,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                appProvider.getUserInformation.phone,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle edit action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
