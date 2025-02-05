import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/presentation/screens/verifying/verify_code.dart';

import '../../widgets/back_ground/class_of_background.dart';
import '../../widgets/buttons/class_of_laregbutton.dart';
import '../../widgets/text/class_of_main_title.dart';
import '../../widgets/text/class_of_textformfield.dart';
import '../../widgets/text/class_of_undertext_maintitle.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});
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
              SizedBox(height: 5),
              UnderMainTtle(text2:"Enter Your Email to receive reset Code" ),
              SizedBox(height: 50),
              TField(textf: "Email",controller: emailController),
                    SizedBox(height: 15),
              LargeButton(textB: "Continue" ,formKey: formKey,emailController: emailController,
                passwordController: passwordController,onpressed: (){if (formKey.currentState!.validate())Navigator.push(context,MaterialPageRoute(builder: (context)=> VerifyCode()));},),
                 const SizedBox(height: 15),
                    Container(height: 420,)
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
