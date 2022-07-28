import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/shared/styles/colors.dart';

class DateBar extends StatefulWidget {

   DateBar({Key? key,}) : super(key: key);

  @override
  State<DateBar> createState() => _DateBarState();
}

class _DateBarState extends State<DateBar> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15 , left: 20),
        child: DatePicker(
          DateTime.now(),
          height: 80,
          width: 65,
          initialSelectedDate: DateTime.now(),
          selectionColor:tealColor,
          selectedTextColor: Colors.white,
          dateTextStyle:GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize:11,
                fontWeight: FontWeight.w600,
                color: tealColor
            ),
          ),
          dayTextStyle:GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize:11,
                fontWeight: FontWeight.w600,
                color: Colors.grey
            ),
          ),
          monthTextStyle:GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize:14,
                fontWeight: FontWeight.w600,
                color: Colors.grey
            ),
          ),
          onDateChange: (date){
            setState((){
              _selectedDate = date;

            });
            print(_selectedDate);

          },
        )
    );
  }
}
