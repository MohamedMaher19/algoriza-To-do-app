import 'package:flutter/material.dart';
import 'package:to_do_app/shared/styles/colors.dart';
import 'package:to_do_app/shared/styles/themes.dart';

class InputFormField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController ? controller;
  final Widget ? widget ;
  final Function? validator;



  InputFormField({Key? key, required this.title, required this.hint, this.controller, this.widget,  this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title , style: titleStyle,),
          Container(
            height:60,
            padding: EdgeInsets.only(left: 14),

            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),

            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator:  (value) => validator!(value),
                    readOnly:widget == null ? false : true ,
                    autofocus: false,
                    cursorColor: blackColor,
                    controller: controller,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          width: 0
                        ),
                      ),
                      hintText: hint,
                      hintStyle:subTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          width: 0,

                        ),

                      ),

                    ),

                  ),

                ),
                widget==null ? Container():Container(child: widget,)

              ],
            ),
          )

        ],
      ),
    );
  }
}
