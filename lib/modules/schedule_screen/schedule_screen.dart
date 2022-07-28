import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/business_logic/app_cubit/app_cubit.dart';
import 'package:to_do_app/business_logic/app_cubit/app_state.dart';
import 'package:to_do_app/models/tasks_model.dart';
import 'package:to_do_app/modules/add_task_screen/add_task_screen.dart';
import 'package:to_do_app/services/notf_serv.dart';
import 'package:to_do_app/shared/components/navigation/navigation.dart';
import 'package:to_do_app/shared/components/widgets/appBar.dart';
import 'package:to_do_app/shared/components/widgets/custom_text.dart';
import 'package:to_do_app/shared/components/widgets/divider.dart';
import 'package:to_do_app/shared/components/widgets/task_design.dart';
import 'package:to_do_app/shared/styles/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  DateTime _selectedDate = DateTime.now();
  var notifyHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();



  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc , AppStates>(
        listener: (context , state){},
        builder: (context , state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(
              onTap: (){
                navigationTo(context, AddTaskScreen());
              },

              context: context,
              elvation: 0,
              title: 'Schedule',
              icon: Container(),
            ),
            body: Column(
              children: [
                DividerLine(),
                addDateBar(),
                SizedBox(
                  height: 15,
                ),
                DividerLine(),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 25, right: 15),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(text: DateFormat.EEEE().format(DateTime.now()),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                      TextUtils(text: DateFormat.yMMMd().format(DateTime.now()),
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: blackColor),
                    ],
                  ),
                ),
                SizedBox(height: 15,),

                showAllTasks(),

              ],
            ),
          );

        });
  }

  showAllTasks(){
   return Expanded(
     child: ListView.builder(
       itemCount:AppBloc.get(context).taskList.length ,
         itemBuilder: (_ , index) {
           Task task = AppBloc.get(context) .taskList[index];


           print(task.toJson());
           if (task.repeat == 'Daily') {
             DateTime date = DateFormat.jm().parse(task.startTime.toString());
             var myTime = DateFormat("HH:mm").format(date);
             notifyHelper.scheduledNotification(
               int.parse(myTime.toString().split(":")[0]),
               int.parse(myTime.toString().split(":")[1]),
               task

             );


             return AnimationConfiguration.staggeredList(
               duration: const Duration(milliseconds: 375),
               position: index,
               child: SlideAnimation(
                 child: FadeInAnimation(
                   child: Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           print('hiii');
                         },
                         child: TaskDesign(task: task,),
                       )
                     ],
                   ),
                 ),
               ),
             );
           }
            if(task.date == DateFormat.yMd().format(_selectedDate)){
              DateTime date = DateFormat.jm().parse(task.startTime.toString());
              var myTime = DateFormat("HH:mm").format(date);
              notifyHelper.scheduledNotification(
                  int.parse(myTime.toString().split(":")[0]),
                  int.parse(myTime.toString().split(":")[1]),
                  task

              );
             return AnimationConfiguration.staggeredList(
               duration: const Duration(milliseconds: 375),
               position: index,
               child: SlideAnimation(
                 child: FadeInAnimation(
                   child: Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           print('hiii');
                         },
                         child: TaskDesign(task: task,),
                       )
                     ],
                   ),
                 ),
               ),
             );


           }
            else{
              return Container(

              );
           }
         }),
   ) ;
  }


 Widget addDateBar(){
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
