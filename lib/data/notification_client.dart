import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationClient {
  late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'channel id',
    'Purchase notifications',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  NotificationClient() {
    _init();
  }

  _init() async {
    print('gfggfg');
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('app_icon'));
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  sendNotification(String message) async {
    const NotificationDetails notificationDetails =
        NotificationDetails(android: _androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, 'Booking Successful', message, notificationDetails);
  }
}
