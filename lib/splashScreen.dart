import 'package:flutter/material.dart';
import 'package:flutter_application_1/onboarding/ctrlOnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
             Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image.asset(
                    'assets/images/79e295e91568f20f79d37810476410489564e188.png', 
                    width: 120,               
                    height: 120,              
                    fit: BoxFit.contain,      
                  ),
                   SizedBox(height: 20),
                   Text(
                    'StudyMate',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C4DDC),
                    ),
                  ),
                   SizedBox(height: 8),
                   Text(
                    'Learn. Practice. Grow.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
             Spacer(),
             SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4C4DDC)),
              ),
            ),
             SizedBox(height: 16),
             Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

