import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;
  var isLoading = false.obs;

  // Sign In Function
  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;

      if (response.user != null) {
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Sign In Failed', 'Invalid email or password');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  // Sign Up Function
  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      isLoading.value = false;

      if (response.user != null) {
        Get.offAllNamed('/home');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  // Sign Out Function
  Future<void> signOut() async {
    await supabase.auth.signOut();
    Get.offAllNamed('/login');
  }
}
