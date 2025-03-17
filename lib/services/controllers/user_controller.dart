import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDetailsController extends GetxController {
  final supabase = Supabase.instance.client;

  var name = ''.obs;
  var location = ''.obs;
  var note = ''.obs;
  var status = 'Safe'.obs; // Default status is "Safe"

  // Function to change status when button is clicked
  void changeStatus() {
    if (status.value == 'Safe') {
      status.value = 'Mild';
    } else if (status.value == 'Mild') {
      status.value = 'Severe';
    } else {
      status.value = 'Safe';
    }
  }

  // Function to save user details in Supabase
  Future<void> saveUserDetails() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      Get.snackbar('Error', 'User not logged in');
      return;
    }

    try {
      final response = await supabase.from('user_details').upsert([
        {
          'user_id': user.id,
          'name': name.value,
          'location': location.value,
          'note': note.value,
          'status': status.value,
          'created_at': DateTime.now().toIso8601String(),
        }
      ]);

      if (response.error == null) {
        Get.snackbar('Success', 'Details saved successfully');
        Get.offAllNamed('/home'); // Navigate to home after saving
      } else {
        Get.snackbar('Error', response.error!.message);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data');
    }
  }
}
