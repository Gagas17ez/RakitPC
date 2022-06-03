import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Welcome/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff9837a5),
      ),
      home: const WelcomeScreen(),
    );
  }
}
