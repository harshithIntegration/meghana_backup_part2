// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificationService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> init() async {
//     // Request permission for receiving push notifications
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     // Get the device token
//     String? token = await _firebaseMessaging.getToken();
//     print('FCM Token: $token');

//     // Handle incoming push notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received message: ${message.notification!.body}');
//       // Handle the incoming push notification
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Message opened: ${message.notification!.body}');
//       // Handle when the user taps on the notification
//     });
//   }

//   // Send push notification
//   Future<void> sendPushNotification(String title, String body) async {
//     // Implement code to send push notification using FCM API
//   }
// }
