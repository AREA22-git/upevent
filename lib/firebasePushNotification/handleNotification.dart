import "dart:developer";
import "package:firebase_messaging/firebase_messaging.dart";

Future<void> handleBackgroundNotification(RemoteMessage message) async {
  log('Title: ${message.notification?.title}');
  log('Body: ${message.notification?.body}');
  log('Payload: ${message.data}');
}

class HandleNotification {
  final _firebaseNotification = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    try {
      await _firebaseNotification.requestPermission();
      final fcmToken = await _firebaseNotification.getToken();
      FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);
      log("Token : ${fcmToken.toString()}");
    } catch (e) {
      log(e.toString());
    }
  }
}
