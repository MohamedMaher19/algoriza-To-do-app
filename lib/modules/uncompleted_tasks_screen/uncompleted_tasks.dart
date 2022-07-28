import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/business_logic/app_cubit/app_cubit.dart';
import 'package:to_do_app/business_logic/app_cubit/app_state.dart';
import 'package:to_do_app/models/tasks_model.dart';
import 'package:to_do_app/shared/components/widgets/board_tasks_item.dart';
import 'package:to_do_app/shared/components/widgets/custom_text.dart';

class UncompTasksScreen extends StatelessWidget {
  const UncompTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc , AppStates>(
        listener: (context , state){},
        builder:(context, state){

          return ListView.separated(
              itemBuilder: (context , index){
                Task task = AppBloc.get(context) .taskList[index];
                if (task.status == 'uncompleted'){
                   return SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.grey[300],
                          elevation: 2,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color:Colors.yellow
                                  ),
                                ),
                                child: Icon(Icons.error_outline, color: Colors.yellow,),),
                              SizedBox(width: 5,),
                              TextUtils(text: task.title.toString(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    showBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                          padding: EdgeInsets.only(top: 4),
                                          height: task.isCompleted == 1
                                              ? MediaQuery.of(context).size.height * 0.24
                                              : MediaQuery.of(context).size.height * 0.32,
                                          color: Colors.grey.withOpacity(0.1),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 6,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(height: 30,),

                                              bottomSheetButton(
                                                  label: 'Completed',
                                                  onTap: () {
                                                    AppBloc.get(context).updateData(id: task.id!, status: 'done');
                                                    Navigator.pop(context);
                                                    AppBloc.get(context).getTasks();

                                                  },
                                                  clr: Colors.blue,
                                                  context: context),
                                              bottomSheetButton(
                                                  label: 'Favorites',
                                                  onTap: () {
                                                    AppBloc.get(context).updateData(id: task.id!, status: 'favorites');

                                                    AppBloc.get(context).getTasks();
                                                    Navigator.pop(context);

                                                  },
                                                  clr: Colors.orangeAccent,
                                                  context: context),
                                            ],
                                          ),
                                        ));
                                  }, icon: Icon(Icons.more_vert_outlined)),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                );
              }else{
                  return Container();
                }} ,
              separatorBuilder: (context , index) => Container(),
              itemCount:AppBloc.get(context).taskList.length);
        } ) ;
  }
}
