import 'package:flutter/material.dart';
import 'package:to_do_app/shared/components/widgets/custom_text.dart';
import 'package:to_do_app/shared/styles/colors.dart';

 appBar({
  required String title,
  required Widget  icon,
   required double elvation,
   required BuildContext context,
   required Function()? onTap,
}){
  return AppBar(
    backgroundColor: Colors.white,
    elevation: elvation,
    title: TextUtils(text: title, fontSize: 18, fontWeight: FontWeight.bold, color: darkClr),
    leading:GestureDetector(
      onTap: onTap,
      child: Icon(Icons.arrow_back_ios_new_rounded , color: darkClr,size: 20,),
    ) ,
    actions: [
      icon
    ],
  );
}