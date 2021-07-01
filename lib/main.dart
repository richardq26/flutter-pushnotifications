import 'package:flutter/material.dart';
import 'package:fluttterprojects/screens/home_screen.dart';
import 'package:fluttterprojects/screens/message_screen.dart';
import 'package:fluttterprojects/services/push_notifications_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          // El guión bajo es que no hace nada
          'home': (_) => HomeScreen(),
          'message': (_) => MessageScreen(),
        });
  }
}
