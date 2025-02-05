import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderMainTtle extends StatelessWidget {
  const UnderMainTtle({required this.text2,this.wi,this.fw,this.si});
final String text2;
final double ?wi;
final FontWeight ?fw;
final double ?si;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: wi ?? 300,
        child: Text(
          text2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: si??14,
            color: Colors.black,
            fontWeight: fw??FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
