import 'package:flutter/material.dart';
import 'package:stude_mate/MyCoursesScreen.dart';

class CoursesDetailsScreen extends StatefulWidget {
  const CoursesDetailsScreen({super.key});

  @override
  State<CoursesDetailsScreen> createState() => CourseDetailsScreenState();
}

class CourseDetailsScreenState extends State<CoursesDetailsScreen> {
  int selectedTab = 0;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Course Details',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border_rounded,
              color: Colors.black87,
            ),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Image Container
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFFE2E6FF),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/39a24077b4f20863ac48ac4a90862ffc6af29a9b.jpg',
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Center(
                                  child: Icon(
                                    Icons.flutter_dash_rounded,
                                    size: 60,
                                    color: Color(0xFF4C4DDC),
                                  ),
                                ),
                          ),
                        ),
                        // Top Category Badge
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xFF4C4DDC),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Mobile Development',
                                  style: TextStyle(
                                    color: Color(0xFF4C4DDC),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Bottom Tech Badge
                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.grid_view_rounded,
                                  size: 12,
                                  color: Color(0xFF4C4DDC),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Flutter 3.x',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Flutter Basics',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Master cross-platform UI composition, reactive state, and declarative design patterns.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: buildMetricTile(
                          icon: Icons.menu_book_rounded,
                          value: '12',
                          label: 'Lessons',
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: buildMetricTile(
                          icon: Icons.star_rounded,
                          iconColor: Colors.amber,
                          value: '4.8',
                          label: 'Reviews',
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: buildMetricTile(
                          icon: Icons.access_time_rounded,
                          value: '3h 45m',
                          label: 'Duration',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFFEEF0FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTab == 0
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: selectedTab == 0
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              size: 18,
                              color: selectedTab == 0
                                  ? Color(0xFF4C4DDC)
                                  : Colors.grey,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Overview',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedTab == 0
                                    ? Color(0xFF4C4DDC)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTab == 1
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: selectedTab == 1
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.format_list_bulleted_rounded,
                              size: 18,
                              color: selectedTab == 1
                                  ? Color(0xFF4C4DDC)
                                  : Colors.grey,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Lessons',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedTab == 1
                                    ? Color(0xFF4C4DDC)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            if (selectedTab == 0) ...[
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Color(0xFF4C4DDC),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'About this course',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Welcome to the foundation of modern cross-platform development! In this self-guided course, you\'ll uncover how Flutter treats everything as a widget. Learn declarative UI construction from scratch, master dynamic nesting in multi-child layouts, handle user interactions through clean forms, and manage reactive application state with absolute confidence.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Feature Highlights Cards
                    Row(
                      children: [
                        Expanded(
                          child: buildFeatureCard(
                            title: 'Widget Trees',
                            subtitle: 'Stateless &\nStateful',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: buildFeatureCard(
                            title: 'Flex Layouts',
                            subtitle: 'Rows, Columns,\nStacks',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Mentor Tip Card
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF0F2FF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFFD6DBFF)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF4C4DDC),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.school_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'StudyMate Mentor Tip',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C4DDC),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Take interactive notes right after Lesson 2 to reinforce widget composition syntax!',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Center(
                  child: Text(
                    'Lessons List Will Be Here',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],

            SizedBox(height: 20),
          ],
        ),
      ),
      // Bottom Action Bar
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next up',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Widgets & Trees',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4C4DDC),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MyCoursesScreen()));
                },
                child: Row(
                  children: [
                    Text(
                      'Start Learning',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMetricTile({
    required IconData icon,
    Color iconColor = const Color(0xFF4C4DDC),
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: iconColor),
              SizedBox(width: 4),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }

  // Feature Card Helper
  Widget buildFeatureCard({required String title, required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.teal,
            size: 20,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
