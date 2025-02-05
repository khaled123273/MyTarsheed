import 'package:flutter/cupertino.dart';

import 'appbar.dart';

class BackStyle extends StatelessWidget {
  const BackStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(bottom: 2,child:Image.asset("assets/imagelogin/Rectangle 3.png",)),
      Positioned(bottom: 2,child:Image.asset("assets/imagelogin/Rectangle 4.png",)),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        painter: BackgroundPainter(),
      ),
    ],) ;
  }
}
