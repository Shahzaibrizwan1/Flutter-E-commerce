import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageHelper {
  static FirebaseStorageHelper instance = FirebaseStorageHelper();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadUserImage(File image) async {
    String Userid =
        FirebaseAuth.instance.currentUser!.uid; // Replace with your user ID
    TaskSnapshot taskSnapshot = _storage.ref(Userid).putFile(image).snapshot;
    String imageurl = await taskSnapshot.ref.getDownloadURL();
    return imageurl;
  }
}
