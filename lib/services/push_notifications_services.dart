//sha1: 3C:F8:31:A5:01:6B:94:62:2C:FA:F2:30:C1:3F:24:4A:AB:66:25:F1
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackground Handler ${message.messageId}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler ${message.messageId}');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler ${message.messageId}');
  }

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    // Local notifications
  }
}
