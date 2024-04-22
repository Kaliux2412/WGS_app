import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/utilities.dart';

Future<void> createPlantComidaNotificacion() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title: '${Emojis.money_money_bag + Emojis.plant_cactus} Compra Nutrientes para tu Planta!!',
      body: 'Hay un Home Depot cerca, alli encontaras todo lo que necesitas.',
      bigPicture: 'lib/Imgs/notification_map.jpg',
      icon: 'resource://drawable/ic_icon.png',
      notificationLayout: NotificationLayout.BigPicture,
      
    ),
      
  );
}
Future<void> createWaterReminderNotification(
  NotificationWeekAndTime notificationSchedule) async {
    await AwesomeNotifications().createNotification(content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'sheduled_channel',
      title: '${Emojis.wheater_droplet} Riega Tu Planta!',
      body: 'Riega tu planta regularmete para tener resultados increíbles.',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE', 
        label: 'Mark Done',
      )
    ],
    schedule: NotificationCalendar(
      weekday: notificationSchedule.dayOfTheWeek,
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}
Future<void> cancelScheduledNotifications()async{
  await AwesomeNotifications().cancelAllSchedules();
}
