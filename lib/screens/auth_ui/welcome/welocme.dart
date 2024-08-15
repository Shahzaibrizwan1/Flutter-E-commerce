import 'package:ecomm_firebase/constant/asset_image.dart';
import 'package:ecomm_firebase/constant/routes.dart';
import 'package:ecomm_firebase/screens/auth_ui/login/login.dart';
import 'package:ecomm_firebase/screens/auth_ui/signup/signup.dart';
import 'package:ecomm_firebase/widgets/primaryButton/primary_button.dart';
import 'package:ecomm_firebase/widgets/topTitles/toptitles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welocome extends StatelessWidget {
  const Welocome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(
                title: "Welcome",
                subtitle: "Buy Any item From here",
              ),
              Center(
                child: Image(
                  image: AssetImage(AssetImages.instance.Welcomeimage),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.facebook,
                      size: 36,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Image(
                      image: AssetImage(
                        AssetImages.instance.googlelogo,
                      ),
                      height: 45,
                      width: 45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              PrimaryButton(
                onPressed: () {
                  Routes.instance.push(widget: const Login(), context: context);
                },
                text: "Login",
              ),
              const SizedBox(
                height: 29,
              ),
              PrimaryButton(
                onPressed: () {
                  Routes.instance
                      .push(widget: const SignUp(), context: context);
                },
                text: "Sign up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
