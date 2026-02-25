import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/auth/auth_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/home/main_screen.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const routeName = 'registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    context.read<AuthBloc>().add(const AuthEvent.resetRegisterStatus());
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.registrationStatus == ApiStatus.success) {
          CustomAlertDialog.showCustomDialog(
            title: state.successMessage ?? 'Registration successful',
            typeAlert: TypeAlert.success,
          );
          AppRoute.pushNamedAndRemoveUntil(MainScreen.routeName);
          context.read<AuthBloc>().add(const AuthEvent.resetRegisterStatus());
        } else if (state.registrationStatus == ApiStatus.error) {
          CustomAlertDialog.showCustomDialog(
            title: state.errorMessage ?? 'Registration failed',
            typeAlert: TypeAlert.error,
          );
          context.read<AuthBloc>().add(const AuthEvent.resetRegisterStatus());
        }
      },
      builder: (context, state) {
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
                          'Complete your account\ndetails',
                          style: context.textStyle1.bold.s24.copyWith(
                            height: 1.2,
                          ),
                        ),
                        gap24,
                        Text('Full Name', style: context.textStyle1.w300.s14),
                        gap4,
                        CustomTextField(
                          controller: _nameController,
                          hintText: '',
                          isCountryCodeNeeded: false,
                        ),
                        gap16,
                        Text('Email', style: context.textStyle1.w300.s14),
                        gap4,
                        CustomTextField(
                          controller: _emailController,
                          hintText: '',
                          isCountryCodeNeeded: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        gap100,
                        CommonButton(
                          text: 'Here we go!',
                          isLoading:
                              state.registrationStatus == ApiStatus.loading,
                          onPressed: () {
                            if (_nameController.text.trim().isEmpty) {
                              CustomAlertDialog.showCustomDialog(
                                title: 'Please enter your name',
                                typeAlert: TypeAlert.warning,
                              );
                              return;
                            }
                            if (_emailController.text.trim().isEmpty) {
                              CustomAlertDialog.showCustomDialog(
                                title: 'Please enter your email',
                                typeAlert: TypeAlert.warning,
                              );
                              return;
                            }

                            final names = _nameController.text.trim().split(
                              ' ',
                            );
                            final firstName = names.first;
                            final lastName = names.length > 1
                                ? names.sublist(1).join(' ')
                                : '';

                            context.read<AuthBloc>().add(
                              AuthEvent.register(
                                firstName: firstName,
                                lastName: lastName,
                                email: _emailController.text.trim(),
                              ),
                            );
                          },
                          backgroundColor: ColorResources.secondary,
                          textStyle: context.textStyle1.w600.s24.white,
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
      },
    );
  }
}
