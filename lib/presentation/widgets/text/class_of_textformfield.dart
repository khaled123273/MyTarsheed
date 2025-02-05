import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TField extends StatefulWidget {
  final String textf;

  TField({required this.textf,required TextEditingController controller, Key? key}) : super(key: key);

  @override
  _TFieldState createState() => _TFieldState();
}

class _TFieldState extends State<TField> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xf1f4ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2666DE)),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: widget.textf,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      validator: (data) {
         {
          if (data == null || data .trim().isEmpty) {
            return 'Email is required';
          }

          final trimmedValue = data .trim();

          // Basic email format validation
          final emailRegex = RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            caseSensitive: false,
          );

          if (!emailRegex.hasMatch(trimmedValue)) {
            return 'Invalid email format';
          }

          // Disposable email check (example domains)
          const disposableDomains = [
            'tempmail.com',
            'mailinator.com',
            '10minutemail.com'
          ];
          final domain = trimmedValue.split('@').last.toLowerCase();
          if (disposableDomains.contains(domain)) {
            return 'Disposable emails are not allowed';
          }

          // International domain validation
          if (RegExp(r'\p{Script=Arabic}', unicode: true).hasMatch(trimmedValue)) {
            return 'International domains must use Punycode encoding';
          }

          return null;
        }
      },
    );
  }
}
