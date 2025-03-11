import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;
  var isLoading = false.obs;

//signinFunction
  Future<void> signIn(String email, String password) async {
    isLoading.value = true;
    final response = await supabase.auth
        .signInWithPassword(email: email, password: password);

    isLoading.value = false;
    if (response.user != null) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', response.error?.message ?? 'Sign in failed');
    }
  }

//signUpFuntion
  Future<void> signUp(String email, String password) async {
    isLoading.value = true;
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    isLoading.value = false;
    if (response.user != null) {
      // Navigate to home if successful
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', response.error?.message ?? 'Sign up failed');
    }
  }

//signOutFuntion
  Future<void> signOut() async {
    await supabase.auth.signOut();
    Get.offAllNamed('/login');
  }
}

extension on AuthResponse {
  get error => null;
}
