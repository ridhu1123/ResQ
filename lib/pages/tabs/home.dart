import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:resq/services/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = authController.supabase.auth.currentUser;
    return Scaffold(
      bottomNavigationBar: const GNav(
          backgroundColor: Color(0xff0C3B2E),
          color: Color(0xffFFBA00),
          gap: 8,
          activeColor: Colors.white,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.sos_sharp,
              text: 'Emergency',
            ),
            GButton(
              icon: Icons.local_hospital_outlined,
              text: 'First Aid',
            ),
            GButton(
              icon: Icons.person_3_outlined,
              text: 'Profile',
            )
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, ${user?.email ?? 'User'}!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: authController.signOut,
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
