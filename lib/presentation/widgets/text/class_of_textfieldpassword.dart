import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  final TextEditingController controller;
  final String? textp;
  final TextEditingController? confirmPasswordController;

  const Password({
    Key? key,
    required this.controller,
    this.textp,
    this.confirmPasswordController,
  }) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xf1f4ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade700),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: widget.textp ?? "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }

        if (widget.confirmPasswordController != null) {
          // لو ده الـ Confirm Password
          if (value != widget.confirmPasswordController!.text) {
            return 'Passwords do not match';
          }
          return null;
        }

        // التحقق الأساسي للباسورد
        final trimmedValue = value.trim();
        if (trimmedValue.length < 8) {
          return 'Password must be at least 8 characters';
        }
        if (trimmedValue.length > 64) {
          return 'Password cannot exceed 64 characters';
        }

        final hasUppercase = RegExp(r'[A-Z]').hasMatch(trimmedValue);
        final hasLowercase = RegExp(r'[a-z]').hasMatch(trimmedValue);
        final hasNumber = RegExp(r'[0-9]').hasMatch(trimmedValue);
        final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(trimmedValue);

        if (!(hasUppercase && hasLowercase && hasNumber && hasSpecialChar)) {
          return '''
          Password must contain:
          - At least 1 uppercase letter
          - At least 1 lowercase letter
          - At least 1 number
          - At least 1 special character
          ''';
        }

        return null;
      },
    );
  }
}
