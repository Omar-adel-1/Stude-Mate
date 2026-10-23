import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginScreen.dart';
import 'package:flutter_application_1/onboarding/onboardingScreeen1.dart';
import 'package:flutter_application_1/onboarding/onboardingScreen2.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  int currentPage = 0;

  final int totalPages = 2;

  void nextPage() {
    if (currentPage == totalPages - 1) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
    
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPage == 0
                      ? SizedBox(width: 48)
                      : IconButton(
                          onPressed: previousPage,
                          icon: Icon(Icons.arrow_back, color: Colors.black87),
                        ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration:  BoxDecoration(
                          color: Color(0xFF4C4DDC),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "StudyMate",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C4DDC),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
    
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  currentPage = value;
                  setState(() {});
                },
                children: [OnBoardingPage1(), OnBoardingPage2()],
              ),
            ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: onBoardingIndicator(index: index),
                ),
              ),
            ),
    
            SizedBox(height: 32),
    
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF4C4DDC),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: nextPage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentPage != totalPages - 1
                            ? "Next"
                            : "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget onBoardingIndicator({required int index}) {
    return AnimatedContainer(
      duration:  Duration(milliseconds: 300),
      height: 6,
      width: currentPage == index ? 24 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ?  Color(0xFF4C4DDC)
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
