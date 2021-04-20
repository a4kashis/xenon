import 'package:flutter/material.dart';
import 'package:xenon/utilities/colors.dart';

Widget customTF(String text, IconData icon) {
  return TextFormField(
    decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: pink)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: pink)),
        suffixIcon: Icon(icon, color: Color(0xFFFFDCEA))),
  );
}

Widget colourButton(String text, Color color) {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          primary: color),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Text(
          text,
          textScaleFactor: 1.4,
          style: TextStyle(color: white),
        ),
      ));
}
