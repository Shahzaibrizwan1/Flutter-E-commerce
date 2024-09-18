import 'dart:developer';
import 'dart:io';
import 'package:ecomm_firebase/firebase_helper/Firebase_storage_helper/firebase_storage_helper.dart';
import 'package:ecomm_firebase/models/UserModel/user_model.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'User Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: appProvider.getUserInformation.image == null
                      ? CupertinoButton(
                          onPressed: takeImage,
                          child: const CircleAvatar(
                            radius: 70,
                            child: Icon(Icons.camera_alt),
                          ),
                        )
                      : CupertinoButton(
                          onPressed: takeImage,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.grey[200],
                            child: ClipOval(
                              child: image != null
                                  ? Image.file(
                                      image!,
                                      width: 140, // Double the radius
                                      height: 140, // Double the radius
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      appProvider.getUserInformation.image!,
                                      width: 140, // Double the radius
                                      height: 140, // Double the radius
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                ),

                // Center(
                //   child: appProvider.getUserInformation.image == null
                //       ? CupertinoButton(
                //           onPressed: () {
                //             takeImage();
                //             // takeimage();
                //           },
                //           child: const CircleAvatar(
                //             radius: 70,
                //             //  backgroundImage: const NetworkImage("profilePictureUrl"),
                //             child: Icon(Icons.camera_alt),
                //           )
                //         )
                //       : CupertinoButton(
                //           onPressed: () {
                //             takeImage();
                //             // takeimage();
                //           },
                //           child: CircleAvatar(
                //               radius: 70,
                //               // backgroundImage: FileImage(image!),
                //               backgroundImage:
                //                   image != null ? FileImage(image!) : null,
                //               // backgroundColor: Colors.grey[200],
                //               child: Image.network(
                //                 appProvider.getUserInformation.image!,
                //                 fit: BoxFit.cover,
                //               )
                //               // appProvider.getUserInformation.image!
                //               ),
                //           // child:
                //           //  const Icon(Icons.camera_alt)
                //         ),
                // ),
                TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: appProvider.getUserInformation.name),
                ),
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
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      UserModel usermodel = appProvider.getUserInformation
                          .copyWith(name: textEditingController.text);
                      appProvider.updateuserinfoFirebase(usermodel, image);
                      String imageUrl = await FirebaseStorageHelper.instance
                          .uploadUserImage(image!);
                      // Handle edit action
                      log("iovfvf");
                      log(imageUrl);
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
      ),
    );
  }
}
