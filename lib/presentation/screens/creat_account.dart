import 'package:flutter/material.dart';
import 'package:graduation/presentation/screens/verifying/verify_email.dart';

import '../widgets/back_ground/class_of_background.dart';
import '../widgets/buttons/class_of_laregbutton.dart';
import '../widgets/buttons/class_of_socialicon.dart';
import '../widgets/text/class_of_main_title.dart';
import '../widgets/text/class_of_textfieldpassword.dart';
import '../widgets/text/class_of_textformfield.dart';
import '../widgets/text/class_of_undertext_maintitle.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController(); // ✅ كنترولر جديد لتأكيد الباسورد

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(child: BackStyle()),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 97),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTitle(maintext: "Create Account"),
                    SizedBox(height: 10),
                    UnderMainTtle(text2: "Create an account so you can easily control your home"),
                    SizedBox(height: 50),
                    TField(textf: "Email", controller: emailController),
                    SizedBox(height: 20),
                    Password(controller: passwordController), // ✅ الباسورد الأساسي
                    SizedBox(height: 20),
                    Password(
                      controller: confirmPasswordController,
                      textp: "Confirm Password",
                      confirmPasswordController: passwordController, // ✅ التحقق من الباسورد الأساسي
                    ),
                    SizedBox(height: 35),
                    LargeButton(
                      textB: "Sign up",
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          if (passwordController.text != confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Passwords do not match"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VerifyEmail()),
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                        },
                        child: Text("Already have an account"),
                      ),
                    ),
                    SizedBox(height: 30),
                    SocialIcons(texts: "Or continue with"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
