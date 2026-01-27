import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/booking_success_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

class ExtraInformationScreen extends StatelessWidget {
  const ExtraInformationScreen({super.key});
  static const routeName = 'extra-information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 0,
        surfaceTintColor: ColorResources.transparent,
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorResources.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text('Book Now', style: context.heading.w400.s24),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text('3/3', style: context.textStyle1.w300.s14),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Extra Information', style: context.textStyle1.w300.s18),
                  gap16,
                  Text('Name (Optional)', style: context.textStyle1.w500.s14),
                  gap4,
                  const CustomTextField(
                    hintText: 'Name',
                    isCountryCodeNeeded: false,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    borderRadius: 15,
                  ),
                  gap16,
                  Text(
                    'Alternate Number (Optional)',
                    style: context.textStyle1.w500.s14,
                  ),
                  gap4,
                  const CustomTextField(
                    hintText: 'Alternate Number ',
                    isCountryCodeNeeded: false,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    borderRadius: 15,
                  ),
                  gap16,
                  Text('Notes (Optional)', style: context.textStyle1.w500.s14),
                  gap4,
                  const CustomTextField(
                    hintText: 'Notes',
                    isCountryCodeNeeded: false,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    maxLines: 6,
                    borderRadius: 15,
                  ),
                  gap16,
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButton(
          text: 'Complete',
          onPressed: () {
            AppRoute.pushNamedAndRemoveUntil(BookingSuccessScreen.routeName);
          },
          backgroundColor: ColorResources.secondary,
          textStyle: context.textStyle1.w600.s24.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
