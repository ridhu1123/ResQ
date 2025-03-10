import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resq/utils/utils.dart';
import 'package:resq/widgets/textfeild.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff0C3B2E),
        title: Center(
          child: Text(
            'Sign Up',
            style: AppTextStyles.bodyLargeWhite,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: res.width(0.45),
            child: Image.asset('assets/logo.png'),
          ),
          Expanded(
            child: Container(
              color: const Color(0xffF9FBFA),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register with                     ResQ',
                      style: AppTextStyles.headlineLargeBlack,
                    ),
                    SizedBox(
                      height: res.width(0.05),
                    ),
                    Text(
                      'Email',
                      style: AppTextStyles.bodyLargeBlack,
                    ),
                    const CustomTextField(hintText: 'email'),
                    SizedBox(
                      height: res.width(0.05),
                    ),
                    Text(
                      'Password',
                      style: AppTextStyles.bodyLargeBlack,
                    ),
                    const CustomTextField(hintText: 'password'),
                    SizedBox(
                      height: res.width(0.05),
                    ),
                    Text(
                      'Confirm Password',
                      style: AppTextStyles.bodyLargeBlack,
                    ),
                    const CustomTextField(hintText: 'password'),
                    SizedBox(
                      height: res.width(0.05),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100, right: 100),
                      child: Container(
                        width: res.width(0.4),
                        height: res.width(0.12),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFBA00),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: AppTextStyles.bodyLargeBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
