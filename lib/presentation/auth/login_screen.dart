import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/auth/otp_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(AppAssets.startImage, fit: BoxFit.cover),

          // Black overlay
          Container(color: ColorResources.black.withOpacity(0.5)),
          // Login Form
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorResources.scaffoldBackground2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Login/ register to\ncontinue',
                      style: context.textStyle1.bold.s24.copyWith(height: 1.2),
                    ),
                    gap24,
                    Text('Phone Number', style: context.textStyle1.w500.s14),
                    gap4,
                    const CustomTextField(
                      hintText: '',
                      isCountryCodeNeeded: false,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                    gap120,
                    CommonButton(
                      text: 'Send OTP',
                      onPressed: () {
                        AppRoute.pushNamed(OtpScreen.routeName);
                      },
                      backgroundColor: ColorResources.secondary,
                      textStyle: context.heading.w600.s24.white,
                    ),
                    gap24,
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
