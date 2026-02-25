import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/application/profile/profile_bloc.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

class EditEmailAddress extends StatefulWidget {
  const EditEmailAddress({super.key});

  static const routeName = 'edit-email';

  @override
  State<EditEmailAddress> createState() => _EditEmailAddressState();
}

class _EditEmailAddressState extends State<EditEmailAddress> {
  final TextEditingController _emailController = TextEditingController();
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  String get _otp => _controllers.map((c) => c.text).join();

  bool _isOtpSent = false;
  late ProfileBloc _profileBloc;

  @override
  void didChangeDependencies() {
    _profileBloc = context.read<ProfileBloc>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    // Reset statuses when screen is closed
    _profileBloc.add(const ProfileEvent.resetEmailRequestStatus());
    _profileBloc.add(const ProfileEvent.resetEmailVerifyStatus());
    super.dispose();
  }

  void _handleButtonPress() {
    if (!_isOtpSent) {
      if (_emailController.text.isNotEmpty &&
          _emailController.text.contains('@')) {
        context.read<ProfileBloc>().add(
          ProfileEvent.updateEmailRequest(email: _emailController.text),
        );
      } else {
        CustomAlertDialog.showCustomDialog(
          typeAlert: TypeAlert.warning,
          title: 'Please enter a valid email address',
        );
      }
    } else {
      if (_otp.length == 4) {
        context.read<ProfileBloc>().add(
          ProfileEvent.updateEmailVerify(
            email: _emailController.text,
            otp: int.parse(_otp),
          ),
        );
      } else {
        CustomAlertDialog.showCustomDialog(
          typeAlert: TypeAlert.warning,
          title: 'Please enter the 4-digit OTP',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // Handle OTP Request response
        if (state.updateEmailRequestStatus == ApiStatus.success &&
            !_isOtpSent) {
          setState(() {
            _isOtpSent = true;
          });
          CustomAlertDialog.showCustomDialog(
            title: 'OTP sent successfully to your email',
            typeAlert: TypeAlert.success,
          );
          context.read<ProfileBloc>().add(
            const ProfileEvent.resetEmailRequestStatus(),
          );
        } else if (state.updateEmailRequestStatus == ApiStatus.error) {
          CustomAlertDialog.showCustomDialog(
            title: state.errorMessage ?? 'Failed to send OTP',
            typeAlert: TypeAlert.error,
          );
          context.read<ProfileBloc>().add(
            const ProfileEvent.resetEmailRequestStatus(),
          );
        }

        // Handle OTP Verification response
        if (state.updateEmailVerifyStatus == ApiStatus.success) {
          CustomAlertDialog.showCustomDialog(
            title: 'Email address updated successfully',
            typeAlert: TypeAlert.success,
          );
          AppRoute.pop();
          context.read<ProfileBloc>().add(
            const ProfileEvent.resetEmailVerifyStatus(),
          );
        } else if (state.updateEmailVerifyStatus == ApiStatus.error) {
          CustomAlertDialog.showCustomDialog(
            title: state.errorMessage ?? 'Verification failed',
            typeAlert: TypeAlert.error,
          );
          context.read<ProfileBloc>().add(
            const ProfileEvent.resetEmailVerifyStatus(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.white,
          elevation: 0,
          surfaceTintColor: ColorResources.transparent,
          leadingWidth: 40,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorResources.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          title: Text('Change Email', style: context.heading.w400.s24),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.help_outline,
                  color: ColorResources.black,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email Address', style: context.textStyle1.w300.s14),
              gap4,
              CustomTextField(
                controller: _emailController,
                hintText: 'Enter New Email Address',
                isCountryCodeNeeded: false,
                keyboardType: TextInputType.emailAddress,
                fillColor: ColorResources.secondaryColor,
                borderColor: ColorResources.transparent,
                borderRadius: 16,
              ),
              if (_isOtpSent) ...[
                gap16,
                Text('OTP', style: context.textStyle1.w300.s14),
                gap4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: ColorResources.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: ColorResources.transparent,
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
                            if (index < 3) {
                              _focusNodes[index + 1].requestFocus();
                            }
                          } else {
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
              ],
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              final isLoading =
                  state.updateEmailRequestStatus == ApiStatus.loading ||
                  state.updateEmailVerifyStatus == ApiStatus.loading;

              return CommonButton(
                text: _isOtpSent ? 'Verify OTP' : 'Send OTP',
                onPressed: _handleButtonPress,
                isLoading: isLoading,
                backgroundColor: ColorResources.secondary,
                textStyle: context.textStyle1.w600.s24.white,
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
