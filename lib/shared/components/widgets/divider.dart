import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2,
      color: Colors.grey.withOpacity(1),
    );
  }
}
