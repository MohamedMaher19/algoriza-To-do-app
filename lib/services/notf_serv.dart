import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:to_do_app/models/tasks_model.dart';


class NotifyHelper{

FlutterLocalNotificationsPlugin
flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

initializeNotification() async {

  configureLocalTimeZone();

  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification
  );



  final AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings("appicon");



  final InitializationSettings initializationSettings =
  InitializationSettings(
    iOS: initializationSettingsIOS,
    android:initializationSettingsAndroid,
  );


  await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification);

}
 displayNotification({required String title, required String body}) async {
  print("doing test");
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name',channelDescription: 'your channel description',
      importance: Importance.max, priority: Priority.high);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    'kkk',
    'jjjj',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}

scheduledNotification(int hour , int minutes , Task task) async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id!.toInt(),
      task.title,
      task.date,
      _converTime(hour , minutes),
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),

      const NotificationDetails(
          android: AndroidNotificationDetails('your channel id',
              'your channel name', channelDescription: 'your channel description')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    payload: "${task.title}|" + "${task.date}|"
  );



}

tz.TZDateTime _converTime(int hour , int minutes){
 final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
 tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local , now.year,now.month, now.day ,hour, minutes);
 if(scheduleDate.isBefore(now)){
   scheduleDate= scheduleDate.add(Duration(days: 1));
 }
return scheduleDate;
}

Future<void>configureLocalTimeZone()async{
  tz.initializeTimeZones();
  final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZone));
}



Future selectNotification(String? payload) async {
  if (payload != null) {
    print('notification payload: $payload');
  } else {
    print("Notification Done");
  }
// Get.to(()=> OpenNotificationScreen(label :payload));

}

// ok
Future onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload ) async {
  // display a dialog with the notification details, tap ok to go to another page
  // Get.dialog(Text('welcome'));
}
}