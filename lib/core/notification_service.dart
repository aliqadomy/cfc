import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Initialize local notifications with callback support
  Future<void> initLocalNotification(BuildContext context) async {
    // Initialize notification settings for both Android and iOS
    var initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    // Initialize the notification plugin
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap when the app is in background or terminated
        if (response.payload != null) {
          // Navigate or perform actions based on payload
          print("Notification payload: ${response.payload}");
          // You can add navigation or other action logic here
        }
      },
    );
  }

  // Initialize Firebase notifications and listen for messages
  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // Handle notification tap when the app is in the background or terminated
      print("Notification opened: ${message.notification?.title}");
      // You can navigate to specific screens here as needed
    });
  }

  // Show notification based on platform-specific configurations
  Future<void> showNotification(RemoteMessage message) async {
    // Android-specific settings
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),  // Unique channel ID for each notification
      'fcm_default_channel',
      importance: Importance.max,
      description: 'Default channel for FCM notifications',
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher',
    );

    // iOS-specific settings
    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      iOS: darwinNotificationDetails,
      android: androidNotificationDetails,
    );

    print("Notification received: ${message.notification?.title} ${message.notification?.body}");

    // Show the notification
    await _flutterLocalNotificationsPlugin.show(
      Random.secure().nextInt(10000),  // Unique ID for each notification
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload: message.data['payload'],  // Pass additional data if needed
    );
  }

  // Request notification permissions on iOS
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Notification permission granted");
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("Notification permission provisionally granted");
    } else {
      print("Notification permission not granted");
    }
  }
}
