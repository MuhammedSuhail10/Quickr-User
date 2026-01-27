import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/auth/registration_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static const routeName = 'otp';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
                    gap16,
                    Text('OTP', style: context.textStyle1.w500.s14),
                    gap4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: ColorResources.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: ColorResources.textFieldBorderColor,
                              width: 0.5,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: context.textStyle1.s20.w600,
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                // Move to next field when digit is entered
                                if (index < 3) {
                                  _focusNodes[index + 1].requestFocus();
                                }
                              } else {
                                // Move to previous field when cleared (backspace on empty field)
                                if (index > 0) {
                                  _focusNodes[index - 1].requestFocus();
                                }
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    gap30,
                    CommonButton(
                      text: 'Verify OTP',
                      onPressed: () {
                        AppRoute.pushNamedAndRemoveUntil(RegistrationScreen.routeName);
                      },
                      backgroundColor: ColorResources.secondary,
                      textStyle: context.heading.w600.s24.white,
                    ),
                    gap4,
                    Text.rich(
                      TextSpan(
                        style: context.textStyle1.s14,
                        children: [
                          TextSpan(
                            text: 'By proceeding with ',
                            style: context.textStyle1.w300.s12,
                          ),
                          TextSpan(
                            text: '"Verify OTP"',
                            style: context.textStyle1.w300.s12,
                          ),
                          TextSpan(
                            text: ', you acknowledge and accept our ',
                            style: context.textStyle1.w300.s12,
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: context.textStyle1.w300.s12.primary,
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: '.',
                            style: context.textStyle1.w300.s12,
                          ),
                        ],
                      ),
                    ),
                    gap12,
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
