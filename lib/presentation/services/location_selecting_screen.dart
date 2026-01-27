import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/add_new_address.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class LocationSelectingScreen extends StatelessWidget {
  const LocationSelectingScreen({super.key});

  static const routeName = 'location-selecting';

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
        title: Text('Add Address Details', style: context.heading.w400.s24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: ColorResources.secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButton(
          text: 'Confirm Location',
          onPressed: () {
            AppRoute.pushNamed(AddNewAddress.routeName);
          },
          backgroundColor: ColorResources.secondary,
          textStyle: context.textStyle1.w600.s24.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
