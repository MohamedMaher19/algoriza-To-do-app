import 'package:flutter/material.dart';
import 'package:to_do_app/modules/add_task_screen/add_task_screen.dart';
import 'package:to_do_app/modules/all_tasks_screen/all_tasks.dart';
import 'package:to_do_app/modules/completed_tasks_screen/completed_tasks.dart';
import 'package:to_do_app/modules/fav_tasks_screen/favorite_tasks.dart';
import 'package:to_do_app/modules/schedule_screen/schedule_screen.dart';
import 'package:to_do_app/modules/uncompleted_tasks_screen/uncompleted_tasks.dart';
import 'package:to_do_app/shared/components/navigation/navigation.dart';
import 'package:to_do_app/shared/components/widgets/custom_button.dart';
import 'package:to_do_app/shared/components/widgets/custom_text.dart';
import 'package:to_do_app/shared/styles/colors.dart';

class BoardScreen extends StatefulWidget {

   BoardScreen({Key? key,   }) : super(key: key);


   @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen>with SingleTickerProviderStateMixin {
  late TabController controller;





   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     controller= TabController(length: 4, vsync: this);
   }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: TextUtils(text:'Board', fontSize: 22, fontWeight: FontWeight.bold, color: darkClr),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                  onTap: (){
                    navigationTo(context, ScheduleScreen());
                  },
                  child: Icon(Icons.calendar_month_rounded , color: Colors.teal,size: 28,)),
            )
          ],
        ),
        body:Column(
          children: [
            Container(
              height: 60,
              child: TabBar(
                controller: controller,
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,

              tabs: [
                Tab(child: Text('All' , ),),
                Tab(child: Text('Completed' ,),),
                Tab(child: Text('Uncompleted' , ),),
                Tab(child: Text('Favorite'  ),),
              ],
                ),
            ),
            Divider(color: Colors.grey,),
            Expanded(
              child: Container(
                width: double.maxFinite,

                child: TabBarView(
                  controller: controller,
                  children: [
                    AllTasksScreen(),
                    CompletedTasksScreen(),
                    UncompTasksScreen(),
                    FavTasksScreen(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              child: CreatTaskButton(
                onPressed: ()async {


                  navigationTo(context , AddTaskScreen());


                },
                text: 'Create a Task',
                buttonColor: tealColor,
                textColor: whiteColor,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20,)
          ],

        ) ,
      ),
    );
  }

}

