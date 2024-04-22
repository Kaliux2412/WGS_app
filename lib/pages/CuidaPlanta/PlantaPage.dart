import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/notificaciones.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/utilities.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/widgets.dart';

import 'DatosPlanta.dart';
class PlantaPage extends StatefulWidget {
  const PlantaPage({Key? key}) : super(key: key);

  @override
  State<PlantaPage> createState() => _PlantaPageState();
}

class _PlantaPageState extends State<PlantaPage> {
  @override
  void initState(){
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        showDialog(
          context: context,
           builder: (context) => AlertDialog(
            title: Text('Permitir Notificaciones'), 
            content: Text('WGS quiere mandarte notificaciones'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text(
                'No Permitir', 
                style: TextStyle(
                  color: Colors.grey, 
                  fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: ()=> AwesomeNotifications()
                  .requestPermissionToSendNotifications()
                  .then((_) => Navigator.pop(context)), 
                  child: Text(
                    'Permitir', 
                    style: TextStyle(
                      color: Colors.teal, 
                      fontSize: 18,
                       fontWeight: FontWeight.bold ),
                ))
            ],
          )
        );
      }
    });

    // AwesomeNotifications().createdStream.listen((event){
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('NotificationCreated on ${notification.channelKey}')))
    // }));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppBarTitle(),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => DatosPlanta(),
            ),
          );
          }, icon: Icon(Icons.insert_chart_outlined_rounded, size: 30,))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlantImage(),
            SizedBox(height: 25,),
            // FloatingActionButton(onPressed: createPlantComidaNotificacion, child: Text('Food'),),
            // FloatingActionButton(onPressed: () async{
            //   NotificationWeekAndTime? pickedSchedule = 
            //   await pickSchedule(context);
            //   if(pickedSchedule != null){
            //     createWaterReminderNotification(pickedSchedule);
            //   }
            // }, child: Text('Water'),),
            // FloatingActionButton(onPressed: cancelScheduledNotifications, child: Text('Cancel'),),

            HomePageButtons(
              onPressedOne: createPlantComidaNotificacion,
              onPressedTwo: () async{
                NotificationWeekAndTime? pickedShedule = 
                await pickSchedule(context);
                if(pickedShedule != null){
                  createWaterReminderNotification(pickedShedule);
                }
              },
              onPressedThree: cancelScheduledNotifications,

            )
          ],
        ),),
    );
  }
}