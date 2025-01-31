import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // لتحديد إذا كان النص مخفي أو لا

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: BackgroundPainter(),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Login Here",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 200,
                      child: Text(
                        "Welcome back you’ve been missed!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xf1f4ff)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade700),
                      ),
                      filled: true,
                      fillColor: Colors.grey[220],
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
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
                      fillColor: Colors.grey[220],
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
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
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: const Text("Sign in",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Create new account"),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      "Or continue with",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/imagelogin/download - Copy.png",
                              scale: 1.3,
                            )),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/imagelogin/download (2) - Copy.png",
                              scale: 2,
                            )),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/imagelogin/download (1) - Copy.png",
                              scale: 1.3,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


