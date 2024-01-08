import 'package:flutter/material.dart';
import 'package:weather_app/views/widgets/text_widget.dart';

Widget myButtom(
    Function onTap,
    {required String txt,
    Color color = Colors.blueAccent,
    double width = double.infinity,
    double height = 50,
    }) {
  return InkWell(
    onTap: ()=>onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: textWidget(txt: txt),
    ),
  );
}
