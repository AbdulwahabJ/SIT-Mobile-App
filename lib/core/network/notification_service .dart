// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // هذا كائن flutter_local_notifications
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // 🔸 إعداد إشعارات محلية - Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // 🔸 إعداد إشعارات محلية - iOS
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    // 🔸 تجميع إعدادات Android و iOS
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // 🔸 تهيئة local notifications
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // 🔸 طلب الإذن لاستقبال الإشعارات من FCM
    await _firebaseMessaging.requestPermission();

    // 🔸 الاشتراك في topic
    await FirebaseMessaging.instance.subscribeToTopic('allUsers');

    // 🔸 عرض التوكن في الـ debug
    _firebaseMessaging.getToken().then((token) {
      print("Device Token: $token");
    });

    // 🔸 استقبال الرسائل في وضع foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 Received message in foreground');
      print('📨 Message data: ${message.data}');

      if (message.notification != null) {
        print('🔔 Notification title: ${message.notification!.title}');
        _showLocalNotification(message);
      }
    });

    // 🔸 عند فتح التطبيق من الإشعار
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('🟢 User opened the app from notification');
    });

    // 🔸 استقبال في الخلفية
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // 🔔 عرض الإشعار المحلي على الجهاز
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id', // يجب أن يتطابق مع الموجود في manifest
      'Default Channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // ID فريد لكل إشعار
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      notificationDetails,
    );
  }
}

// 📦 هذه لمعالجة الرسائل بالخلفية
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('📤 Background message received: ${message.messageId}');
}
