// ignore_for_file: file_names
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsApi {
  static final _nofications = FlutterLocalNotificationsPlugin();
  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _nofications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
