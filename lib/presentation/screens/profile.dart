import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigator() ,
      backgroundColor: Colors.white,
      appBar:CustomAppBar(text: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('assets/imagelogin/avatar.png') as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(Icons.camera_alt, size: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildTextField('First Name', '', false),
              buildTextField('Last Name', '', false),
              buildTextField('Email', '', false),
              buildTextField('Password', '', true),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String value, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 5),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF2666DE)), // لون الحدود عند التركيز
              borderRadius: BorderRadius.circular(10),
            ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue, width: 1.5),
              ),
              suffixIcon: isPassword
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
              )
                  : Icon(Icons.edit),
            ),
          ),
        ],
      ),
            );
  }
}
