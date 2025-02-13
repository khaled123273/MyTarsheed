import 'package:flutter/material.dart';

enum FieldType { email, password, confirmPassword, code }

class CustomTextField extends StatefulWidget {
  final FieldType fieldType;
  final TextEditingController controller;
  final TextEditingController? originalPasswordController;
  final String? hintText;

  const CustomTextField({
    Key? key,
    required this.fieldType,
    required this.controller,
    this.originalPasswordController,
    this.hintText,

  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    String defaultHint;
    switch (widget.fieldType) {
      case FieldType.email:
        keyboardType = TextInputType.emailAddress;
        defaultHint = "Email";
        break;
      case FieldType.password:
        keyboardType = TextInputType.visiblePassword;
        defaultHint = "Password";
        break;
      case FieldType.confirmPassword:
        keyboardType = TextInputType.visiblePassword;
        defaultHint = "Confirm Password";
        break;
      case FieldType.code:
        keyboardType = TextInputType.number;
        defaultHint = "Enter Code";
        break;
    }

    return TextFormField(
      controller: widget.controller,
      keyboardType: keyboardType,
      obscureText: (widget.fieldType == FieldType.password ||
          widget.fieldType == FieldType.confirmPassword)
          ? _obscureText
          : false,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff1f4ff)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade700),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: widget.hintText ?? defaultHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: (widget.fieldType == FieldType.password ||
            widget.fieldType == FieldType.confirmPassword)
            ? IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "${defaultHint} is required";
        }
        final trimmedValue = value.trim();
        switch (widget.fieldType) {
          case FieldType.email:
            final emailRegex = RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              caseSensitive: false,
            );
            if (!emailRegex.hasMatch(trimmedValue)) {
              return 'Invalid email format';
            }
            return null;
          case FieldType.password:
            if (trimmedValue.length < 8) {
              return 'Password must be at least 8 characters';
            }
            if (trimmedValue.length > 64) {
              return 'Password cannot exceed 64 characters';
            }
            final hasUppercase = RegExp(r'[A-Z]').hasMatch(trimmedValue);
            final hasLowercase = RegExp(r'[a-z]').hasMatch(trimmedValue);
            final hasNumber = RegExp(r'[0-9]').hasMatch(trimmedValue);
            final hasSpecialChar =
            RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(trimmedValue);
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
          case FieldType.confirmPassword:
            if (widget.originalPasswordController == null) {
              return 'Original password is not provided';
            }
            if (trimmedValue != widget.originalPasswordController!.text.trim()) {
              return 'Passwords do not match';
            }

            return null;
          case FieldType.code:
            final codeRegex = RegExp(r'^\d+$');
            if (!codeRegex.hasMatch(trimmedValue)) {
              return 'Code must contain numbers only';
            }
            return null;

        }
      },
    );
  }
}
