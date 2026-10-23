import 'package:flutter/material.dart';
import 'package:stude_mate/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyMate',
      
      theme: ThemeData(
        fontFamily: 'Tajawal', 
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  SplashScreen(),
    );
  }
}


