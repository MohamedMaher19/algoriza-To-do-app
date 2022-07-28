import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/business_logic/app_cubit/app_cubit.dart';
import 'package:to_do_app/business_logic/app_cubit/app_state.dart';
import 'package:to_do_app/models/tasks_model.dart';
import 'package:to_do_app/modules/board_screen/board_screen.dart';
import 'package:to_do_app/modules/schedule_screen/schedule_screen.dart';
import 'package:to_do_app/services/notf_serv.dart';
import 'package:to_do_app/shared/components/navigation/navigation.dart';
import 'package:to_do_app/shared/components/widgets/appBar.dart';
import 'package:to_do_app/shared/components/widgets/custom_button.dart';
import 'package:to_do_app/shared/components/widgets/custom_text.dart';
import 'package:to_do_app/shared/components/widgets/input_field.dart';
import 'package:to_do_app/shared/styles/colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm  a').format(DateTime.now()).toString();
  String endTime = '10:00 Am';
  int selectedReminder = 4;
  List<int> reminderList = [
    1,
    5,
    15,
    20,
  ];
  String selectedRepeat = 'None';
  List<String> repeatList = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
  ];
  int selectedColors = 0;
  final TextEditingController titleController = TextEditingController();
  var formkey = GlobalKey<FormState>();
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
              navigationTo(context, BoardScreen());

            },

            context: context,
            elvation: 1,
            title: 'Add task',
            icon: Container(),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    InputFormField(
                      title: 'Title',
                      hint: 'Enter Your Title',
                      controller: titleController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter Title';
                        }
                        return null;
                      },
                    ),
                    InputFormField(

                      title: 'Date',
                      hint: DateFormat.yMd().format(selectedDate),
                      widget: IconButton(
                        onPressed: () {
                          getDateFromUser(context);
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputFormField(
                            validator: () {},

                            title: 'Start Time',
                            hint: startTime,
                            widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: true);
                              },
                              icon: Icon(Icons.access_alarm_outlined),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: InputFormField(

                            title: 'End Time',
                            hint: endTime,
                            widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: false);
                              },
                              icon: Icon(Icons.access_alarm_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InputFormField(

                      title: 'Remind',
                      hint: '$selectedReminder minutes early',
                      widget: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        iconSize: 30,
                        underline: Container(
                          height: 0,
                        ),
                        elevation: 4,
                        items:
                        reminderList.map<DropdownMenuItem<String>>((int value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedReminder = int.parse(value!);
                          });
                        },
                      ),
                    ),
                    InputFormField(
                      title: 'Repeat',
                      hint: '$selectedRepeat  ',
                      widget: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        iconSize: 30,
                        underline: Container(
                          height: 0,
                        ),
                        elevation: 4,
                        items: repeatList
                            .map<DropdownMenuItem<String>>((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedRepeat = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtils(
                              fontWeight: FontWeight.bold,
                              text: 'Colors',
                              color: blackColor,
                              fontSize: 15,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Wrap(
                              children: List<Widget>.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColors = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: CircleAvatar(
                                      radius: 11,
                                      backgroundColor: index == 0
                                          ? pinkClr
                                          : index == 1
                                          ? Colors.yellow
                                          : index == 2
                                          ? tealColor
                                          : kCOlor2,
                                      child: selectedColors == index
                                          ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 18,
                                      )
                                          : Container(),
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CreatTaskButton(
                      onPressed: ()async {
                         await AppBloc.get(context).initDb();
                        validateTitle();

                        navigationTo(context , ScheduleScreen());
                        AppBloc.get(context).getTasks();

                      },
                      text: 'Create a Task',
                      buttonColor: tealColor,
                      textColor: whiteColor,
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
  }
  addTaskToDb()async{
    int value =   await AppBloc.get(context).adTask(
        task:  Task(
          title: titleController.text,
          date: DateFormat.yMd().format(selectedDate),
          startTime: startTime,
          endTime: endTime,
          remind: selectedReminder,
          repeat: selectedRepeat,
          color: selectedColors,
          isCompleted: 0,
          status: 'new'


        ));
    print(' my id is $value');



  }



  getDateFromUser(BuildContext context) async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2120));
    if (pickDate != null) {
      setState(() {
        selectedDate = pickDate;
      });
    } else {
      print('something went wrong');
    }
  }

  getTimeFromUser({required bool isStartTime}) async {
    var pickTime = await showTimePick();
    String formatedTime = pickTime.format(context);
    if (pickTime == null) {
      print('time canceld');
    } else if (isStartTime == true) {
      setState(() {
        startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime = formatedTime;
      });
    }
  }

  showTimePick() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(startTime.split(":")[0]),
            minute: int.parse(startTime.split(":")[1].split(" ")[0])));
  }
  validateTitle(){
    if(titleController.text.isNotEmpty){
      addTaskToDb();


    }else if (titleController.text.isEmpty){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: '',
        desc: 'Title can not be empty',
        btnCancelOnPress: () {

        },
        btnOkOnPress: () {

        },
      )..show();
    }
  }
}
