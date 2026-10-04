import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  TextEditingController playerController;
  String hintText;
  CustomField({required this.playerController , required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:playerController ,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.person),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

