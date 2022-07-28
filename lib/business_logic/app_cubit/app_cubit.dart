import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/business_logic/app_cubit/app_state.dart';
import 'package:to_do_app/models/tasks_model.dart';

class AppBloc extends Cubit<AppStates>{
  AppBloc(): super(AppInitialState());


  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm  a').format(DateTime.now()).toString();
  String endTime = '10:00 Am';
  int selectedReminder = 4;
  List<int> reminderList = [
    1,
    1,
    30,
    10,
  ];
  String selectedRepeat = 'weekly';
  List<String> repeatList = [
    'None',
    'weekly',
    'Daily',
    'Monthly',
  ];

  int selectedColors = 0;
  final TextEditingController titleController = TextEditingController();

  static Database ? db ;
  static final version = 1;
  static final tableName = 'tasks';

  var taskList = <Task>[];
  var compTasks= <Task>[];
  var unCompTasks= <Task>[];







   Future<void> initDb()async{
    if(db != null){
      return;
    }try{
      String path = await getDatabasesPath() + 'tasks.db';
      db = await openDatabase(
        path,
        version: version,
        onCreate: (db , version){
          debugPrint('Table Created');
          return db.execute(
              'CREATE TABLE $tableName ('
                  'id INTEGER PRIMARY KEY ,'
                  ' title STRING, date STRING,'
                  ' startTime STRING, endTime STRING ,'
                  ' remind INTEGER , repeat STRING ,'
                  ' color INTEGER , isCompleted INTEGER ,status TEXT)').then((value) {

                    emit(AppDatabaseInitialized());
          });
        },

      );

    }catch (e){
      print(e);
    }

  }


  Future<int> adTask({Task ? task})async{
    return await insert(task);


  }

  void updateData({
  required String status,
    required int id,
})async{
    db!.rawUpdate(
        'UPDATE $tableName SET status = ? WHERE id = ?',
        [status ,id],
    ).then((value) {
      emit(updateDb());
    });

  }


// return the id of the row
   Future<int> insert(Task ? task)async{
    debugPrint('insert to db');
    emit(AppDatabaseInserted());

    return await db?.insert(tableName, task!.toJson())??1;

  }



   Future <List<Map<String,dynamic>>> query()async{
    return await db!.rawQuery('SELECT * FROM $tableName');
     }

  void getTasks()async{
    List<Map<String ,dynamic>> tasks = await query();
      taskList= tasks.map((data) => new Task.fromJson(data)).toList();
      print('>>>>taskList>>>>>');
      print("????>>>>>>>>>>>>>>${taskList.toString()}");

    emit(getDataFromDb());
  }


  void deleteTask(Task task)async{

    await db!.delete(tableName , where: 'id=?' , whereArgs: [task.id]);
  }

  static update( id){
     db!.rawUpdate('''
      UPDATE tasks
      SET isCompleted = ?
      WHERE id =?
      ''',[1,id]);

  }



  }





