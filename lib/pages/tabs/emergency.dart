import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resq/services/controllers/user_controller.dart';
import 'package:resq/utils/utils.dart';

class EmergencyPage extends StatelessWidget {
  final UserDetailsController controller = Get.find();

  EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: res.width(0.8),
              width: res.width(0.8),
              child: SingleChildScrollView(
                child: Text(
                  "To stay safe during a flood, it's essential to stay informed by monitoring local news and weather reports. If ordered to evacuate, do so immediately and move to higher ground or a safe location. Avoid walking, driving, or swimming in floodwaters, as they can be contaminated with sewage, chemicals, and sharp debris. To secure your home, move valuables to higher floors, cover electronics and furniture, and bring outdoor items inside. Once the floodwaters have receded, wait for authorities to declare it safe to return home before inspecting your property and documenting any damage for insurance purposes.",
                  style: AppTextStyles.bodyLargeBlack,
                ),
              ),
            ),
            SizedBox(
              height: res.width(0.1),
            ),
            Obx(() => ElevatedButton(
                  onPressed: controller.changeStatus,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.status.value == 'Safe'
                        ? Colors.green
                        : controller.status.value == 'Mild'
                            ? Colors.orange
                            : Colors.red,
                  ),
                  child: Text(
                    controller.status.value,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
            SizedBox(height: 20),
            InkWell(
              onTap: controller.saveUserDetails,
              child: Container(
                width: res.width(0.4),
                height: res.width(0.12),
                decoration: BoxDecoration(
                    color: const Color(0xffFFBA00),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Save',
                    style: AppTextStyles.bodyLargeBlack,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
