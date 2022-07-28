import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/business_logic/app_cubit/app_cubit.dart';
import 'package:to_do_app/models/tasks_model.dart';
import 'package:to_do_app/shared/styles/colors.dart';
import 'package:to_do_app/shared/styles/themes.dart';

class TaskDesign extends StatelessWidget {
  final Task? task;

  TaskDesign({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 12),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: backGroundColor(task!.color ?? 0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task?.title ?? "",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      )),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey[200],
                          size: 18,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${task!.startTime} - ${task!.endTime}',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[100],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              RotatedBox(
                  quarterTurns: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.task_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {

                    },

                  )),
            ],
          ),
        ));
  }

  backGroundColor(int number) {
    switch (number) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.teal;
      default:
        return kCOlor2;
    }
  }

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

  Widget circAvat() {
    return CircleAvatar(
      radius: 13,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(Icons.check_circle_outline),
        onPressed: () {},
      ),
    );
  }
}
