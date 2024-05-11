import 'package:flutter/material.dart';

Widget unDefineRoute()=> const Scaffold(
  body: Center(
    child: Text("unDefineRoute"),
  ),
);
Widget defaultFormField(
    {required TextEditingController controller,
      required String lable,
      required Function validate,
      bool isPassword = false}) =>
    TextFormField(
        controller: controller,
        validator: (value) {
          validate(value);
        },
        obscureText: isPassword,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: lable,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12)))
    );