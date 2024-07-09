import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:demo_9july/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dynamc_icon.dart';

class Notifi extends StatefulWidget {
  const Notifi({super.key});

  @override
  State<Notifi> createState() => _NotifiState();
}

class _NotifiState extends State<Notifi> {
 @override
  void initState() {
   AwesomeNotifications().isNotificationAllowed().then((isAllowed){
     if(!isAllowed){
       AwesomeNotifications().requestPermissionToSendNotifications();
     }
   });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is Notification Screen!'),
      ),
      body: Center(
        child: ElevatedButton(
          style: getBtnStyle(context),
          child: const Text('Show Notification',style: TextStyle(color: Colors.white),),
          onPressed: (){
            AwesomeNotifications().createNotification(content: NotificationContent(
                id: 1,
                channelKey: "basic_channel",
                title: "Hello User",
                body: "You have successfully logged-in !"));
            // NotificationService().showNotification(
            //   title: 'Demo Test',
            //   body: 'This is text of body!'
            // );
          },
        ),
      ),
    );
  }
}
