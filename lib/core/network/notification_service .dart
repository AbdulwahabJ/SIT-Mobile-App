// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initialize() {
    // طلب الإذن لاستقبال الإشعارات (خاص بـ iOS)
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.instance
        .subscribeToTopic('allUsers'); // الاشتراك في topic

    // استلام التوكن الفريد
    _firebaseMessaging.getToken().then((token) {
      print("Device Token: $token");
      // يمكنك إرسال هذا التوكن إلى الخادم لتخزينه واستخدامه في إرسال الإشعارات.
    });

    // معالجة الإشعارات عند وصولها (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while app is in foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification!.title}');
        // هنا يمكن استعراض الإشعار في نافذة أو نافذة منبثقة.
      }
    });

    // معالجة الإشعار عند فتح التطبيق من خلاله
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // يمكنك هنا تنفيذ أمر معين عند فتح التطبيق من الإشعار
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  if (message.notification != null) {
    print(
        'Background message also contained a notification: ${message.notification}');
    // يمكنك هنا تنفيذ أي إجراء أو معالجة إضافية.
  }
}
