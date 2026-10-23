import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginScreen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4C4DDC)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF4C4DDC),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFFE2E6FF),
                    child: Text(
                      'AJ',
                      style: TextStyle(
                        color: Color(0xFF4C4DDC),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Omar Adel',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Omar@example.com',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFF5CD8A6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Pro Learner',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

          
            buildSectionHeader('ACCOUNT'),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  buildSettingsTile(
                    icon: Icons.person_outline_rounded,
                    title: 'Edit Profile',
                    subtitle: 'Update display name, avatar and email',
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 60),
                  buildSettingsTile(
                    icon: Icons.lock_outline_rounded,
                    title: 'Change Password',
                    subtitle: 'Manage credentials and security',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            buildSectionHeader('PREFERENCES'),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  buildSwitchTile(
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    subtitle: 'Course reminders & study alerts',
                    value: notificationsEnabled,
                    onChanged: (val) {
                      setState(() {
                        notificationsEnabled = val;
                      });
                    },
                  ),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 60),
                  buildSwitchTile(
                    icon: Icons.nightlight_round_outlined,
                    title: 'Dark Mode',
                    subtitle: 'Light / Dark theme toggle',
                    value: darkModeEnabled,
                    onChanged: (val) {
                      setState(() {
                        darkModeEnabled = val;
                      });
                    },
                  ),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 60),
                  buildSettingsTile(
                    icon: Icons.translate_rounded,
                    title: 'Language',
                    subtitle: 'English (US)',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            buildSectionHeader('OTHER'),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  buildSettingsTile(
                    icon: Icons.info_outline_rounded,
                    title: 'About StudyMate',
                    subtitle: 'v1.0.0 (Build 42)',
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 60),
                  buildSettingsTile(
                    icon: Icons.support_agent_rounded,
                    title: 'Help & Support',
                    subtitle: 'FAQs and student contact line',
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey.shade100, indent: 60),
                  buildSettingsTile(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    subtitle: 'Sign out of this student device',
                    isDestructive: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),

            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFEEF0FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.code_rounded,
                          size: 14,
                          color: Color(0xFF4C4DDC),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Scaffold • ListView.separated • Card',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF4C4DDC),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'StudyMate Education Suite • Flutter 3.x',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
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

  
  Widget buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isDestructive = false,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isDestructive ? Color(0xFFFFEFEF) : Color(0xFFF0F2FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isDestructive ? Colors.redAccent : Color(0xFF4C4DDC),
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDestructive ? Colors.redAccent : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: isDestructive
            ? Colors.redAccent.withValues(alpha: 0.5)
            : Colors.grey,
      ),
    );
  }

  Widget buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xFFF0F2FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Color(0xFF4C4DDC), size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: Switch(
        value: value,
        activeThumbColor: Color(0xFF4C4DDC),
        onChanged: onChanged,
      ),
    );
  }
}
