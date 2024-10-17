import 'package:flutter/material.dart';
import 'package:projek/core/utils/constant_color.dart';
import 'package:projek/features/eLib/presentation/widgets/bottom_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/100'),
              ),
            ),
            SizedBox(height: 16),
            // User Name
            Text(
              'Alfred Rajendra Wijaya',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              '220605110103@student.uin-malang.ac.id',
              style: TextStyle(color: ConstantColor.grey),
            ),
            SizedBox(height: 16),
            // Edit Profile Button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                },
                child: Text('Edit Profile'),
              ),
            ),
            SizedBox(height: 16),
            // Bio
            Text(
              'This is a short bio about the user. It can include interests, hobbies, etc.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Settings Section
            Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Navigate to change password page
              },
            ),
            ListTile(
              title: Text('Privacy Settings'),
              onTap: () {
                // Navigate to privacy settings page
              },
            ),
            ListTile(
              title: Text('Notification Preferences'),
              onTap: () {
                // Navigate to notification preferences page
              },
            ),
            // Logout Button
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Logout action
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(backgroundColor: ConstantColor.primary),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}
