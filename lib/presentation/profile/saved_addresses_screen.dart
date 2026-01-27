import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  static const routeName = 'saved-address';

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
        title: Text('Saved Addresses', style: context.heading.w400.s24),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.help_outline, color: ColorResources.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: _AddressCard(
              label: 'Home',
              address:
                  '[House Number/Flat Number],\n[Building Name/Street Name],\nVaishnavi Park Nashik,\nMaharashtra,\n422003',
            ),
          );
        },
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String label;
  final String address;

  const _AddressCard({required this.label, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textStyle1.w400.s14),
                gap8,
                Text(address, style: context.textStyle1.w300.s12),
              ],
            ),
          ),
          gap12,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(AppAssets.edit, () {}),
              gap12,
              _buildIconButton(AppAssets.delete, () {}, isDelete: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
    String imgPath,
    VoidCallback onPressed, {
    bool isDelete = false,
  }) {
    return Container(
      height: 43,
      width: 43,
      decoration: BoxDecoration(
        color: isDelete ? ColorResources.red : ColorResources.transparent,
        border: isDelete ? null : Border.all(color: ColorResources.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(imgPath, height: 18, width: 18),
      ),
    );
  }
}
