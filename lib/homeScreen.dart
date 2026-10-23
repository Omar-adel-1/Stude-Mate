import 'package:flutter/material.dart';
import 'package:flutter_application_1/MyCoursesScreen.dart';
import 'package:flutter_application_1/SettingsScreen.dart';
import 'package:flutter_application_1/loginScreen.dart';
import 'package:flutter_application_1/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: CustomNavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded, color: Colors.black87),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFF4C4DDC),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.school_rounded, size: 16, color: Colors.white),
            ),
            SizedBox(width: 8),
            Text(
              'StudyMate',
              style: TextStyle(
                color: Color(0xFF4C4DDC),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),

        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),

            // User Greeting Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Omar 👋',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'What do you want to learn today?',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(
                        'assets/images/WhatsApp Image 2026-09-25 at 15.41.41.jpeg',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search courses, topics...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: Icon(Icons.search_rounded, color: Colors.grey),
                suffixIcon: Icon(Icons.tune_rounded, color: Colors.grey),
                filled: true,
                fillColor: Color(0xFFF8F9FE),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 24),

            // Featured Courses Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all >',
                    style: TextStyle(
                      color: Color(0xFF4C4DDC),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            // Featured Courses (Horizontal Scroll)
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FeaturedCourseCard(
                    category: 'Development',
                    title: 'Flutter Basics',
                    lessons: '12 Lessons',
                    duration: '3h 45m',
                    progress: 0.65,
                    progressText: '65%',
                    badgeColor: Color(0xFF4C4DDC),
                  ),
                  SizedBox(width: 16),
                  FeaturedCourseCard(
                    category: 'Design',
                    title: 'UI/UX Fundamentals',
                    lessons: '10 Lessons',
                    duration: '2h 30m',
                    progress: 0.40,
                    progressText: '40%',
                    badgeColor: Color(0xFF7000FF),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // All Courses Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.sort_rounded, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      'Sort by',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12),

            // All Courses (Vertical List)
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                CourseItemListTile(
                  title: 'Flutter Basics',
                  subtitle: 'Mobile Development • 12 Lessons',
                  progress: 0.65,
                  progressText: '65%',
                  icon: Icons.flutter_dash_rounded,
                  iconBgColor: Color(0xFFEEF0FF),
                  iconColor: Color(0xFF4C4DDC),
                  progressColor: Colors.teal,
                ),
                CourseItemListTile(
                  title: 'Dart Programming',
                  subtitle: 'Programming • 18 Lessons',
                  progress: 0.85,
                  progressText: '85%',
                  icon: Icons.code_rounded,
                  iconBgColor: Color(0xFFFFF7E6),
                  iconColor: Colors.orange,
                  progressColor: Colors.teal,
                ),
                CourseItemListTile(
                  title: 'UI/UX Fundamentals',
                  subtitle: 'Design System • 10 Lessons',
                  progress: 0.40,
                  progressText: '40%',
                  icon: Icons.palette_outlined,
                  iconBgColor: Color(0xFFFFEFEF),
                  iconColor: Colors.redAccent,
                  progressColor: Color(0xFF4C4DDC),
                ),
                CourseItemListTile(
                  title: 'Firebase Essentials',
                  subtitle: 'Backend & Auth • 15 Lessons',
                  progress: 0.15,
                  progressText: '15%',
                  icon: Icons.local_fire_department_rounded,
                  iconBgColor: Color(0xFFFFF4E5),
                  iconColor: Colors.amber,
                  progressColor: Colors.purple,
                ),
              ],
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 24),
            color: Color(0xFF4C4DDC),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.school_rounded,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'StudyMate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close_rounded, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/images/WhatsApp Image 2026-09-25 at 15.41.41.jpeg',
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Omar Adel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'omar.johnson@example.com',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              children: [
                buildDrawerItem(
                  index: 0,
                  icon: Icons.home_rounded,
                  title: 'Home',
                  onTap: () {
                    onItemTapped(0);
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
                  },
                ),

                buildDrawerItem(
                  index: 1,
                  icon: Icons.school_outlined,
                  title: 'My Courses',
                  onTap: () {
                    onItemTapped(1);
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyCoursesScreen()));
                  },
                ),

                
                buildDrawerItem(
                  index: 2,
                  icon: Icons.person_outline,
                  title: 'Profile',
                  onTap: () {
                    onItemTapped(2);
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileScreen()));
                  },
                ),

                
                buildDrawerItem(
                  index: 3,
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {
                    onItemTapped(3);
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                  },
                ),

                 Divider(height: 32),

                
                ListTile(
                  leading:  Icon(
                    Icons.logout_rounded,
                    color: Colors.redAccent,
                  ),
                  title:  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    
                  },
                ),
              ],
            ),
          ),

        
          Container(
            padding:  EdgeInsets.all(16),
            color:  Color(0xFFF8F9FE),
            child:  Row(
              children: [
                Icon(Icons.crop_square_rounded, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'StudyMate v1.0.0 • Scaffold(drawer)',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context); 
  }


  Widget buildDrawerItem({
    required int index,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    bool isSelected = selectedIndex == index;

    return Container(
      margin:  EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: isSelected ?  Color(0xFFEEF0FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(
          icon,
          color: isSelected ?  Color(0xFF4C4DDC) : Colors.black87,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ?  Color(0xFF4C4DDC) : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        trailing: isSelected
            ?  Icon(Icons.check, color: Color(0xFF4C4DDC), size: 18)
            :  Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        onTap: onTap,
      ),
    );
  }
}

class FeaturedCourseCard extends StatelessWidget {
  final String category;
  final String title;
  final String lessons;
  final String duration;
  final double progress;
  final String progressText;
  final Color badgeColor;

  const FeaturedCourseCard({
    super.key,
    required this.category,
    required this.title,
    required this.lessons,
    required this.duration,
    required this.progress,
    required this.progressText,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Banner Header
          Container(
            height: 100,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white70, size: 12),
                    SizedBox(width: 4),
                    Text(
                      duration,
                      style: TextStyle(color: Colors.white70, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category == 'Development' ? 'Mobile App' : 'Product Design',
                  style: TextStyle(
                    color: Color(0xFF4C4DDC),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '$lessons • $duration',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      progressText,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseItemListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final String progressText;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final Color progressColor;

  const CourseItemListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.progressText,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          progressColor,
                        ),
                        minHeight: 4,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      progressText,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: progressColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
