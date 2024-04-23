
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//CONFIGURACIONES INTERNAS PARA PERMISOS DE ANDROID PARA MADAR NOTIFICACIONES


class NotificationService{
  final FlutterLocalNotificationsPlugin notificationPlugin = 
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async{
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('icon');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await notificationPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async{});
  }

  notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName', 
      importance: Importance.max
      )
    );
  }
  

  Future showNotification({int id = 0, String? title, String? body, String? payload})async{
    return notificationPlugin.show(id, title, body, await notificationDetails());
  }
}