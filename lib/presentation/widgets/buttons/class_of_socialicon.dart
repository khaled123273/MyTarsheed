import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/presentation/constants/icons_and_images.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({required this.texts,});
final String texts;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(texts,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2666DE),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 44,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(MyAssets.google,
                    scale: 1.3,fit:BoxFit.fill,
                  )),
            ),
            SizedBox(width: 8),
            Container(
              height: 44,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(MyAssets.facebook,

                    scale: 2,fit:BoxFit.fill,
                  )),
            ),
            SizedBox(width: 8),
            Container(
              height: 44,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(MyAssets.apple,fit:BoxFit.fill
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
