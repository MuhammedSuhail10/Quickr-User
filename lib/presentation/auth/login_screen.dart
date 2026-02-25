import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/auth/otp_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/auth/auth_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  late final AuthBloc _authBloc;
  DateTime? _lastBackPressTime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _authBloc.add(const AuthEvent.resetSendOtp());
    _phoneController.dispose();
    super.dispose();
  }

  bool _handleBackPress() {
    final now = DateTime.now();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;

      // Show an improved professional snackbar with logo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo, width: 16, height: 16),
              const SizedBox(width: 12),
              const Text(
                'Press back again to exit Quickr-User',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: ColorResources.black,
          duration: const Duration(seconds: 2),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.06,
            left: screenWidth * 0.099, // 7.5% margin on each side (15% total)
            right: screenWidth * 0.099,
          ),
          elevation: 4,
        ),
      );

      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.sendOtpStatus == ApiStatus.success) {
          if (state.otpResponse?.status == true) {
            AppRoute.pushNamed(
              OtpScreen.routeName,
              arguments: {'phoneNumber': _phoneController.text},
            );
            CustomAlertDialog.showCustomDialog(
              title: state.otpResponse?.message ?? 'OTP sent to mobile number',
            );
            context.read<AuthBloc>().add(const AuthEvent.resetSendOtp());
          } else {
            CustomAlertDialog.showCustomDialog(
              typeAlert: TypeAlert.error,
              title: state.otpResponse?.message ?? 'Something went wrong',
            );
            context.read<AuthBloc>().add(const AuthEvent.resetSendOtp());
          }
        } else if (state.sendOtpStatus == ApiStatus.error) {
          CustomAlertDialog.showCustomDialog(
            typeAlert: TypeAlert.error,
            title: state.errorMessage ?? 'Something went wrong',
          );
          context.read<AuthBloc>().add(const AuthEvent.resetSendOtp());
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;

          final shouldPop = _handleBackPress();
          if (shouldPop) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
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
                          style: context.textStyle1.bold.s24.copyWith(
                            height: 1.2,
                          ),
                        ),
                        gap24,
                        Text(
                          'Phone Number',
                          style: context.textStyle1.w300.s14,
                        ),
                        gap4,
                        CustomTextField(
                          controller: _phoneController,
                          hintText: '',
                          isCountryCodeNeeded: false,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                        ),
                        gap120,
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return CommonButton(
                              text: 'Send OTP',
                              isLoading:
                                  state.sendOtpStatus == ApiStatus.loading,
                              onPressed: () {
                                if (_phoneController.text.length == 10) {
                                  context.read<AuthBloc>().add(
                                    AuthEvent.sendOtp(
                                      mobile: _phoneController.text,
                                    ),
                                  );
                                } else {
                                  CustomAlertDialog.showCustomDialog(
                                    typeAlert: TypeAlert.warning,
                                    title:
                                        'Please enter a valid 10-digit phone number',
                                  );
                                }
                              },
                              backgroundColor: ColorResources.secondary,
                              textStyle: context.heading.w600.s24.white,
                            );
                          },
                        ),
                        gap24,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
