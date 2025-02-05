import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/presentation/widgets/buttons/class_of_laregbutton.dart';

import '../../widgets/back_ground/class_of_background.dart';
import '../../widgets/text/class_of_main_title.dart';
import '../../widgets/text/class_of_textfieldpassword.dart';
import '../../widgets/text/class_of_undertext_maintitle.dart';

class VerifyFinish extends StatelessWidget {
   VerifyFinish({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
            children: [
              Positioned.fill(
                child: BackStyle(),
              ),SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 97),
                      child: Form(
                            key: formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTitle(maintext: "Verify Your Identity "),
                                SizedBox(height: 1),
                                UnderMainTtle(text2:"Enter Your New Password" ),
                                SizedBox(height: 50),
                                SizedBox(height: 15),
                                Password(controller: passwordController,textp: "New Password",),
                                SizedBox(height: 20),
                                Password(
                                  controller: confirmPasswordController,
                                  textp: "Confirm Password",
                                  confirmPasswordController: passwordController, // ✅ التحقق من الباسورد الأساسي
                                ),                                SizedBox(height: 15,),
                                LargeButton(textB: "finish", formKey: formKey, passwordController: passwordController,
                                  onpressed: () {
                                 if (formKey.currentState!.validate()) {
                                 if (passwordController.text != confirmPasswordController.text) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                  content: Text("Passwords do not match"),
                                   backgroundColor: Colors.red,
                                  ),
                                  );
                               } else {print("لسه التقيل جي");}
                              }
                              }
                          ),
                                Container(height: 400,)
                              ]
                          )
                      )
                  )

              )
            ]
        )
    );
  }
}
