import 'package:flutter/material.dart';

// AREA QUE PROGRAMARA LAS NOTIFICACIONES QUE ARROJARA LA SECCIÓN DE CUENTA, PARA CUIDAR LA PLANTA

int createUniqueId(){
  return DateTime.now().microsecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime{
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    required this.dayOfTheWeek,
    required this.timeOfDay,
  });
}

Future<NotificationWeekAndTime?> pickSchedule(
  BuildContext context,
) async {
  List<String> weekdays = [
    'Lun',
    'Mar',
    'Mie',
    'Jue',
    'Vie',
    'Sab',
    'Dom',
  ];
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();
  int? selectedDay;
  await showDialog(context: context, builder: (context){
    return AlertDialog();
  });
}