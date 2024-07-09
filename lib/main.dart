import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:demo_9july/Notificationdemo/FirebaseAPI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Badesystem.dart';
import 'dynamc_icon.dart';
import 'firebase_options.dart';
import 'Notificationdemo/local-Noti.dart';
import 'login/postmandemo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  // await AwesomeNotifications().initialize(null, [
  //   NotificationChannel(
  //       channelGroupKey: "basic_channel_group",
  //       channelKey: "basic_channel",
  //       channelName: "Basic Notification",
  //       channelDescription: "Basic notification channel")
  // ], channelGroups: [
  //   NotificationChannelGroup(
  //       channelGroupKey: "basic_channel_group", channelGroupName: "Basic_group")
  // ]);
  // bool isAllowedToSendNotification =
  // await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowedToSendNotification) {
  //   AwesomeNotifications().requestPermissionToSendNotifications();
  // }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      ///(firebase+local) Notification
      //home: Notifi(),
      ///Login by postman
      home:LoginScreen(),
      ///shimmer effect
      //home: ShimmerEffect(),
    ),
  );
}

///Local Notification Setup
class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'System Performance Monitor',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ShimmerEffect(),
//     );
//   }
// }
