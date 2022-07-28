import 'package:flutter/material.dart';
import 'package:to_do_app/shared/styles/themes.dart';

bottomSheetButton({
  required String label,
  required Function()? onTap,
  required Color clr,
  bool isClosed = false,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 55,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          color: isClosed == true ? Colors.red : clr,
          border: Border.all(
              width: 2, color: isClosed == true ? Colors.red : clr),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          label,
          style: isClosed
              ? titleStyle
              : titleStyle.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}

