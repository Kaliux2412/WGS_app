import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:flutter_application_1/pages/CuidaPlanta/PlantaPage.dart';


//AREA PARA INICIAZILAR  NOTIFICACIONES

void main() {
  AwesomeNotifications().initialize(null,
  [
    NotificationChannel(
      channelKey: 'basic_channel', 
      channelName: 'Basic Notifications', 
      defaultColor: Colors.teal,
      importance: NotificationImportance.High,
      channelShowBadge: true,
      channelDescription: "Recibe notificaciones básicas de la aplicación."      
    ),
    
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