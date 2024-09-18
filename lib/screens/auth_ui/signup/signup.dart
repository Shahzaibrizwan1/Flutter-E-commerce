import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_auth_helper/firebae_auth_helper.dart';
import 'package:ecomm_firebase/screens/auth_ui/login/login.dart';
import 'package:ecomm_firebase/screens/coustom_bottom_bar/custom_bottom_bar.dart';
import 'package:ecomm_firebase/screens/home/home.dart';
import 'package:ecomm_firebase/widgets/primaryButton/primary_button.dart';
import 'package:ecomm_firebase/widgets/topTitles/toptitles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showpassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                title: "Create Account",
                subtitle: "Welcome to Storia",
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "Name", prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone", prefixIcon: Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormField(
                  controller: PasswordController,
                  obscureText: showpassword,
                  decoration: InputDecoration(
                      hintText: "Create Password",
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showpassword = !showpassword;
                          });
                        },
                        child: const Icon(Icons.visibility),
                      ))),
              const SizedBox(
                height: 18,
              ),
              PrimaryButton(
                text: "Create Account",
                onPressed: () async {
                  bool accountvalidate = CreateAccountValidation(
                      emailController.text,
                      PasswordController.text,
                      nameController.text,
                      phoneController.text);
                  if (accountvalidate) {
                    bool creatAccount = await FirebaseAuthHelper.instance
                        .CreatesAccount(
                            emailController.text.toString(),
                            PasswordController.text,
                            nameController.text,
                            phoneController.text,
                            context);
                    if (creatAccount) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomNaviagtionBar()));
                      showMessage("Account Created Successful");
                    }
                  }
                  // Navigate to the home screen
                },
              ),
              const SizedBox(
                height: 9,
              ),
              const Center(
                child: Text(
                  "Already have an account? ",
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Routes.instance
                        .push(widget: const Login(), context: context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
