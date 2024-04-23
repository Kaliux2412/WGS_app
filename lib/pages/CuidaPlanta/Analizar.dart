import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/PlantaPage.dart';


//AREA PARA INICIALIZAR LAS NOTIFICACIONES
void main() {
  AwesomeNotifications().initialize('resource://drawable/ic_icon',
  [
    NotificationChannel(
      channelKey: 'basic_channel', 
      channelName: 'Basic Notifications', 
      defaultColor: Colors.teal,
      importance: NotificationImportance.High,
      channelShowBadge: true,
      channelDescription: "Recibe notificaciones básicas de la aplicación."      
    ),
    
    NotificationChannel(
      channelKey: 'sheduled_channel',
      channelName: 'Sheduled Notifications',
      defaultColor: Colors.teal,
      locked:true,
      importance: NotificationImportance.High,
      soundSource: 'resource://raw/sonido_notificacion',
      channelDescription: 'FLutterApp',
      enableVibration: true,
    )
  ], debug: true);
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      title: "EL Cuidado en tus Manos",
      home: PlantaPage(),
    );
  }
}