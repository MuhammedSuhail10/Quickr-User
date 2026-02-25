import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/application/home/home_bloc.dart';

/// Shows the Verify Code bottom sheet.
void showVerifyCodeBottomSheet(BuildContext context, {required int orderId}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorResources.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<HomeBloc>(),
      child: VerifyCodeBottomSheet(orderId: orderId),
    ),
  );
}

class VerifyCodeBottomSheet extends StatefulWidget {
  final int orderId;
  const VerifyCodeBottomSheet({super.key, required this.orderId});

  @override
  State<VerifyCodeBottomSheet> createState() => _VerifyCodeBottomSheetState();
}

class _VerifyCodeBottomSheetState extends State<VerifyCodeBottomSheet> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Auto-submit when all 4 digits are filled
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == 4) {
      FocusScope.of(context).unfocus();
      context.read<HomeBloc>().add(
        HomeEvent.verifyOrder(orderId: widget.orderId, otp: int.parse(otp)),
      );
    }
  }

  void _clearOtp() {
    for (final c in _controllers) {
      c.clear();
    }
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prev, curr) =>
          prev.verifyOrderStatus != curr.verifyOrderStatus,
      listener: (context, state) {
        if (state.verifyOrderStatus == ApiStatus.success) {
          // Show success, close sheet, refresh scheduled orders
          Navigator.of(context).pop();
          CustomAlertDialog.showCustomDialog(
            title: 'Order verified successfully!',
          );
          context.read<HomeBloc>().add(const HomeEvent.getScheduledOrders());
          context.read<HomeBloc>().add(
            const HomeEvent.resetVerifyOrderStatus(),
          );
        } else if (state.verifyOrderStatus == ApiStatus.error) {
          // Show error, clear OTP, stay on sheet
          CustomAlertDialog.showCustomDialog(
            title: state.errorMessage ?? 'Verification failed',
            typeAlert: TypeAlert.error,
          );
          _clearOtp();
          context.read<HomeBloc>().add(
            const HomeEvent.resetVerifyOrderStatus(),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 32, 24, 32 + bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text('Code', style: context.textStyle1.bold.s28.white),
            gap8,
            // Subtitle
            Text(
              'Enter code provided by the employee',
              style: context.textStyle1.w300.s14.white,
            ),
            gap32,
            // OTP boxes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) => _buildOtpBox(index)),
              ),
            ),
            gap32,
            // Loading indicator
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (prev, curr) =>
                  prev.verifyOrderStatus != curr.verifyOrderStatus,
              builder: (context, state) {
                if (state.verifyOrderStatus == ApiStatus.loading) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorResources.white,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            // Disclaimer
            Text(
              'For security, ask code from the employee. Only after verifying should the worker be allowed to start working/ to enter the home.',
              style: context.textStyle1.w300.s12.white.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 72,
      height: 80,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: context.textStyle1.bold.s28.copyWith(
          color: ColorResources.primary,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFD0D8D4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: ColorResources.white, width: 2),
          ),
        ),
        onChanged: (value) => _onChanged(value, index),
      ),
    );
  }
}
