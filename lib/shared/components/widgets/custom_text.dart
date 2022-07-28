import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  TextUtils({Key? key, required this.text, required this.fontSize,this.align, this.fontFamily, required this.fontWeight, required this.color}) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
   String ? fontFamily;
  TextAlign ? align ;


  @override
  Widget build(BuildContext context) {
    return Text(text ,
      textAlign:align,
      style: TextStyle(

      height: 1.5,
      fontSize: fontSize,
      fontFamily:fontFamily ,
      color:color,
      fontWeight: fontWeight,
    ),);
  }
}