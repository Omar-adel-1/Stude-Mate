import 'package:flutter/material.dart';
import 'package:stude_mate/CoursesDetailsScreen.dart';
import 'package:stude_mate/homeScreen.dart';

class CourseModel {
  final String category;
  final String title;
  final String description;
  final int completedLessons;
  final int totalLessons;
  final double progress;
  final String completionPercentage;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final Color progressColor;

  CourseModel({
    required this.category,
    required this.title,
    required this.description,
    required this.completedLessons,
    required this.totalLessons,
    required this.progress,
    required this.completionPercentage,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.progressColor,
  });
}

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => MyCoursesScreenState();
}

class MyCoursesScreenState extends State<MyCoursesScreen> {
  final List<CourseModel> _courses = [
    CourseModel(
      category: 'Mobile Development',
      title: 'Flutter Basics',
      description: 'Widgets, state & responsive layouts',
      completedLessons: 8,
      totalLessons: 12,
      progress: 0.65,
      completionPercentage: '65% Complete',
      icon: Icons.flutter_dash_rounded,
      iconBgColor: Color(0xFFEEF0FF),
      iconColor: Color(0xFF4C4DDC),
      progressColor: Color(0xFF00875A),
    ),
    CourseModel(
      category: 'Programming Language',
      title: 'Dart Programming',
      description: 'Async, OOP paradigms & Null safety',
      completedLessons: 7,
      totalLessons: 18,
      progress: 0.40,
      completionPercentage: '40% Complete',
      icon: Icons.code_rounded,
      iconBgColor: Color(0xFFEEF0FF),
      iconColor: Color(0xFF4C4DDC),
      progressColor: Color(0xFF4C4DDC),
    ),
    CourseModel(
      category: 'Design System',
      title: 'UI/UX Fundamentals',
      description: 'Material 3, spacing grids & typography',
      completedLessons: 2,
      totalLessons: 10,
      progress: 0.20,
      completionPercentage: '20% Complete',
      icon: Icons.palette_outlined,
      iconBgColor: Color(0xFFEEF0FF),
      iconColor: Color(0xFF4C4DDC),
      progressColor: Color(0xFF4C4DDC),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ),
        ),
        title: Text(
          'My Courses',
          style: TextStyle(
            color: Color(0xFF4C4DDC),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_rounded, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enrolled Studies',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${_courses.length} Courses in Progress',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                return CourseProgressCard(course: _courses[index]);
              },
            ),

            SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Color(0xFFF0F2FF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFFD6DBFF),
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFE2E6FF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.menu_book_rounded,
                      color: Color(0xFF4C4DDC),
                      size: 28,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Looking for a fresh challenge?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Explore our curated catalog of mobile engineering tracks and advanced state management.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursesDetailsScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Browse More Courses',
                          style: TextStyle(
                            color: Color(0xFF4C4DDC),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xFF4C4DDC),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CourseProgressCard extends StatelessWidget {
  final CourseModel course;

  const CourseProgressCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFEEF0FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  course.category,
                  style: TextStyle(
                    color: Color(0xFF4C4DDC),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.timelapse_rounded,
                    size: 16,
                    color: course.progressColor,
                  ),
                  SizedBox(width: 4),
                  Text(
                    course.completionPercentage,
                    style: TextStyle(
                      color: course.progressColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 12),

          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: course.iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(course.icon, color: course.iconColor, size: 24),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      course.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: course.progress,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(course.progressColor),
              minHeight: 6,
            ),
          ),

          SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 14,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${course.completedLessons} completed',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
              Text(
                '${course.totalLessons} Lessons total',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),

          SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C4DDC),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_rounded, color: Colors.white, size: 20),
                  SizedBox(width: 6),
                  Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
