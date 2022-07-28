import 'package:flutter/material.dart';


 navigationTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);