import 'package:flutter/material.dart';
import 'package:to_do_app/shared/components/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.fontSize,
      required this.textColor,
      this.fontFamily,
      required this.buttonColor})
      : super(key: key);

  final String text;
  final Function() onPressed;
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          primary: buttonColor,
          minimumSize: Size(400, 60),
        ),
        onPressed: onPressed,
        child: TextUtils(
          fontFamily: fontFamily,
          text: text,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
        ));
  }
}
