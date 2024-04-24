import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/notificaciones.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/utilities.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/widgets.dart';

import 'DatosPlanta.dart';

// AREA QUE REVISA LOS PERMISOS PARA MANDAR NOTIFICACIONES Y COMO FUNCIONARA SI SI SE PERMITEN.
class PlantaPage extends StatefulWidget {
  const PlantaPage({Key? key}) : super(key: key);

  @override
  State<PlantaPage> createState() => _PlantaPageState();
}

class _PlantaPageState extends State<PlantaPage> {
   DateTime _selectedDate = DateTime.now();

  TimeOfDay _selectedTime = TimeOfDay.now();
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

            Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Selecciona la fecha y hora para la notificación de riego:'),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,

                          initialDate: _selectedDate,

                          firstDate: DateTime.now(),

                          lastDate: DateTime(DateTime.now().year + 1),

                        );

                        if (pickedDate != null) {

                          setState(() {

                            _selectedDate = pickedDate;

                          });

                        }

                      },

                      child: Text('Fecha'),

                    ),

                    SizedBox(width: 16),

                    ElevatedButton(

                      onPressed: () async {

                        final TimeOfDay? pickedTime = await showTimePicker(

                          context: context,

                          initialTime: _selectedTime,

                        );

                        if (pickedTime != null) {

                          setState(() {

                            _selectedTime = pickedTime;

                          });

                        }

                      },

                      child: Text('Hora'),

                    ),

                  ],

                ),

              ],

            ),

          ),

          ElevatedButton(

            onPressed: () {

              final NotificationWeekAndTime notificationSchedule = NotificationWeekAndTime(

                dayOfTheWeek: _selectedDate.weekday,

                timeOfDay: _selectedTime,

              );

              createWaterReminderNotification(notificationSchedule);

              Navigator.pop(context);

            },

            child: Text('Guardar'),

          ),

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