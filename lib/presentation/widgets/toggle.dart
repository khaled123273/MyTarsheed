import 'package:flutter/material.dart';

class BuildToggle extends StatefulWidget {
  const BuildToggle({super.key, required this.title});
final String title;
  @override
  _BuildToggleState createState() => _BuildToggleState();
}

class _BuildToggleState extends State<BuildToggle> {
  bool isFaceIdEnabled = false;
  bool isTwoStepEnabled = true;

  Widget buildToggleRow(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Switch(
            value: value,
            onChanged: (newValue) {
              setState(() {
                onChanged(newValue);
              });
            },
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.blue[200],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildToggleRow("Face-ID", isFaceIdEnabled, (val) {
          isFaceIdEnabled = val;
        }),
        buildToggleRow("Two-Step Verification", isTwoStepEnabled, (val) {
          isTwoStepEnabled = val;
        }),
      ],
    );
  }
}
