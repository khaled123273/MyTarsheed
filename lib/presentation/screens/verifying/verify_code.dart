import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/presentation/screens/verifying/verify_finish.dart';

import '../../widgets/back_ground/class_of_background.dart';
import '../../widgets/text/class_of_main_title.dart';
import '../../widgets/text/class_of_undertext_maintitle.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Positioned.fill(
            child: BackStyle(),
          ),
          SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 97),
                  child: Form(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        MainTitle(maintext: "Verify Your Identity "),
                        SizedBox(height: 1),
                        UnderMainTtle(
                            text2: "We have sent an email to mo****@gmail."),
                        SizedBox(height: 50),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xf1f4ff)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2666DE)),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Enter Code",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                            width: 357,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF2666DE),
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyFinish()));
                              },
                              child: Text("Continue",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  )),
                            )),
                        Container(
                          height: 420,
                        )
                          ]
                      )
                  )
              )
          )
        ]));
  }
}
