import 'package:flutter/material.dart';
import 'package:xenon/utilities/colors.dart';

Widget customTF(
    String text, IconData icon, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        (value) {
          if (value.isEmpty) {
            return 'Field Cannot be Empty!';
          }
          return null;
        };
      },
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: pink)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: pink)),
          suffixIcon: Icon(icon, color: Color(0xFFFFDCEA))),
    ),
  );
}

void showInSnackBar(_scaffoldKey, String value, Function func) {
  _scaffoldKey.currentState
      .showSnackBar(SnackBar(
        content: Text(value),
        duration: Duration(milliseconds: 1400),
      ))
      .closed
      .then(func);
}
// Widget colourButton(String text, Color color) {
//   return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(
//           shape: new RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(20.0),
//           ),
//           primary: color),
//       child: Padding(
//         padding: const EdgeInsets.symmetric( horizontal: 8.0),
//         child: Text(
//           text,
//           overflow: TextOverflow.clip,
//           textScaleFactor: 1.2,
//           style: TextStyle(color: white),
//         ),
//       ));
// }

Widget colourButton(String text, Color color) {
  return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.6),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Text(
          text,
          overflow: TextOverflow.clip,
          textScaleFactor: 1.2,
          style: TextStyle(color: white),
        ),
      ));
}

Widget bNTile(String image, String label, Color color) {
  return Expanded(
    child: Column(
      children: [
        Image.asset(image, height: 20),
        SizedBox(height: 6.0),
        Text(
          label,
          style: TextStyle(color: color),
        )
      ],
    ),
  );
}
