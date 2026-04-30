import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/report_emergency_screen.dart';
import 'screens/track_screen.dart';
import 'screens/dispatcher_screen.dart';
import 'screens/responder_screen.dart';
import 'screens/admin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Emergency System',

      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      initialRoute: '/splash',

      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/report': (context) => ReportEmergencyScreen(),
        '/track': (context) => TrackScreen(),
        '/dispatcher': (context) => DispatcherScreen(),
        '/responder': (context) => ResponderScreen(),
        '/admin': (context) => AdminScreen(),
      },
    );
  }
}