import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupTitle extends StatelessWidget {
  const SupTitle({required this.text2,this.width,this.fontweight,this.size});
final String text2;
final double ?width;
final FontWeight ?fontweight;
final double ?size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: width ?? 300,
        child: Text(
          text2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size??14,
            color: Colors.black,
            fontWeight: fontweight??FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
