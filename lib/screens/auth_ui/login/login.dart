import 'package:ecomm_firebase/constant/connstant.dart';
import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_auth_helper/firebae_auth_helper.dart';
import 'package:ecomm_firebase/screens/home/home.dart';
import 'package:ecomm_firebase/widgets/primaryButton/primary_button.dart';
import 'package:ecomm_firebase/widgets/topTitles/toptitles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  bool showpassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
              title: "Login",
              subtitle: "Welcome Back to Ecommerce Hub",
            ),
            const SizedBox(
              height: 45,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Email", prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: showpassword,
                decoration: InputDecoration(
                    hintText: "Password",
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
              height: 25,
            ),
            PrimaryButton(
              text: "Login",
              onPressed: () async {
                print('Login button pressed');
                bool isValidate = emailValidation(
                    emailController.text, passwordController.text);
                if (isValidate) {
                  print('Validation passed');
                  bool isLogined = await FirebaseAuthHelper.instance.login(
                      emailController.text, passwordController.text, context);
                  if (isLogined) {
                    Routes.instance.pushAndRemoveUntil(
                        widget: const Home(), context: context);
                  }
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: Text(
                "Don't have an account? ",
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: CupertinoButton(
                onPressed: () {},
                child: Text(
                  "Create Account",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
