// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

//! for loading

void showLoadingDialog(BuildContext context) {
  print('Showing loading dialog...');
  AlertDialog alert = AlertDialog(content: Builder(builder: (context) {
    return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Color(0xffe16555),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading......"),
            )
          ],
        ));
  }));
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getMessageFromErrorCode(String errorCode) {
  print('Received error code: $errorCode');
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";

    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email/password combination.";

    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";
    case "invalid-credential":
      return "No user found.";

    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";

    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";

    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return "Server error, please try again later.";

    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";

    default:
      return "Login failed. Please try again.";
  }
}

bool emailValidation(String email, String password) {
  print('Validating email: $email and password: $password');
  if (email.isEmpty && password.isEmpty) {
    showMessage("Both Fields are required");
    return false;
  }
  if (email.isEmpty) {
    showMessage("Email is Empty");
    print("Validation failed: Email is empty");
    return false;
  } else if (!email.contains('@')) {
    showMessage("Invalid Email");
    print("Validation failed: Invalid email");
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is Empty");
    print("Validation failed: Password is empty");
    return false;
  } else {
    print("Validation passed");

    return true;
  }
}

bool CreateAccountValidation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage("all Fields are required");
    return false;
  }
  if (email.isEmpty) {
    showMessage("Email is Empty");

    return false;
  } else if (!email.contains('@')) {
    showMessage("Invalid Email");

    return false;
  } else if (password.isEmpty) {
    showMessage("Password is Empty");

    return false;
  } else if (phone.isEmpty) {
    showMessage("Phone Number is Empty");

    return false;
  } else if (name.isEmpty) {
    showMessage("Name is Empty");

    return false;
  } else {
    print("Validation passed");

    return true;
  }
}
// bool emailValidation(String email, String password) {
//   if (email.isEmpty) {
//     showMessage("Email is Empty");
//     return false;
//   } else if (!email.contains('@')) {
//     showMessage("Invalid Email");
//     return false;
//   } else if (password.isEmpty) {
//     showMessage("Password is Empty");
//     return false;
//   } else {
//     return true;
//   }
// }
