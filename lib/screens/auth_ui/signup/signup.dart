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
                decoration: const InputDecoration(
                    hintText: "Name", prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone", prefixIcon: Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 9,
              ),
              TextFormField(
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
                onPressed: () {},
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
                  onPressed: () {},
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
