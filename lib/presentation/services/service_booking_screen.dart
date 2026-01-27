import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/extra_information_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/location_selecting_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class ServiceBookingScreen extends StatelessWidget {
  const ServiceBookingScreen({super.key});
  static const routeName = 'service-booking';

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
              child: Text('2/3', style: context.textStyle1.w300.s14),
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
                  Text('Select Address', style: context.textStyle1.w300.s14),
                  gap16,

                  // Home Address Card
                  const _AddressCard(
                    label: 'Home',
                    address:
                        '[House Number/Flat Number],\n[Building Name/Street Name],\nYashwant Park Nashik,\nMaharashtra,\n422003',
                    isSelected: true,
                  ),

                  gap16,

                  // Work Address Card
                  const _AddressCard(
                    label: 'Work',
                    address:
                        '[House Number/Flat Number],\n[Building Name/Street Name],\nYashwant Park Nashik,\nMaharashtra,\n422003',
                    isSelected: false,
                  ),
                  gap24,
                  // Add New Address Button
                  CommonButton(
                    text: 'Add New Address',
                    textStyle: context.textStyle1.w700.s20.copyWith(
                      color: ColorResources.primary,
                    ),
                    backgroundColor: ColorResources.secondaryColor,
                    borderWidth: 1,
                    onPressed: () {
                      AppRoute.pushNamed(LocationSelectingScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButton(
          text: 'Next',
          onPressed: () {
            AppRoute.pushNamed(ExtraInformationScreen.routeName);
          },
          backgroundColor: ColorResources.secondary,
          textStyle: context.textStyle1.w600.s24.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String label;
  final String address;
  final bool isSelected;

  const _AddressCard({
    required this.label,
    required this.address,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textStyle1.w300.s14),
                gap8,
                Text(address, style: context.textStyle1.w300.s12),
              ],
            ),
          ),
          gap12,
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? ColorResources.primary : ColorResources.white,
            ),
            child: isSelected
                ? const Icon(Icons.check, size: 16, color: ColorResources.white)
                : null,
          ),
        ],
      ),
    );
  }
}
