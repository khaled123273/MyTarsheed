import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/presentation/screens/creat_account.dart';
import 'package:graduation/presentation/widgets/back_ground/class_of_background.dart';
import 'package:graduation/presentation/widgets/buttons/class_of_laregbutton.dart';
import 'package:graduation/presentation/widgets/text/class_of_main_title.dart';
import 'package:graduation/presentation/widgets/buttons/class_of_socialicon.dart';
import 'package:graduation/presentation/widgets/text/class_of_textfieldpassword.dart';
import 'package:graduation/presentation/widgets/text/class_of_textformfield.dart';
import 'package:graduation/presentation/widgets/text/class_of_undertext_maintitle.dart';

import '../widgets/back_ground/appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
         Positioned.fill(
           child: BackStyle(),),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 97),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   MainTitle(maintext: "Login Here"),
                    SizedBox(height: 30),
                    UnderMainTtle(text2:"Welcome back you’ve been missed!",fw: FontWeight.w600,si: 20,wi: 228, ),
                    SizedBox(height: 64),
                     TField(textf: "Email",controller: emailController),
                    SizedBox(height: 20),
                    Password(controller: passwordController,),
                    SizedBox(height: 21),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    LargeButton(textB: "Sign in" ,formKey: formKey,emailController: emailController,
                      passwordController: passwordController,onpressed: (){},),
                    const SizedBox(height: 15),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPage()));
                        },
                        child: Text("Create new account"),
                      ),
                    ),
                    SizedBox(height: 30),
                    SocialIcons(texts: "Or continue with"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


