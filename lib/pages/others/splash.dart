import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthChecker extends StatelessWidget {
  final supabase = Supabase.instance.client;

  AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          // Navigate based on auth status
          Future.microtask(() {
            Get.offAllNamed(snapshot.data == true ? '/home' : '/onboarding');
          });

          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<bool> _checkAuthStatus() async {
    final session = supabase.auth.currentSession;
    return session != null; // Return true if logged in
  }
}
