import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  static const routeName = 'add-new-address';

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  final _houseNoController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _houseNoController.dispose();
    _landmarkController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Map placeholder container
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: ColorResources.secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                gap24,
                Text('Add Address', style: context.textStyle1.w600.s18),
                gap16,
                // House No/ Name field
                Text('House No/ Name', style: context.textStyle1.w500.s14),
                gap4,
                CustomTextField(
                  controller: _houseNoController,
                  hintText: '',
                  isCountryCodeNeeded: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  fillColor: ColorResources.secondaryColor,
                  borderColor: ColorResources.transparent,
                  borderRadius: 16,
                ),
                gap16,
                // Landmark field
                Text('Landmark (Optional)', style: context.textStyle1.w500.s14),
                gap4,
                CustomTextField(
                  controller: _landmarkController,
                  hintText: '',
                  isCountryCodeNeeded: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  fillColor: ColorResources.secondaryColor,
                  borderColor: ColorResources.transparent,
                  borderRadius: 16,
                ),
                gap16,
                // Alternate Number & Name section
                Text('Name (Optional)', style: context.textStyle1.w500.s14),
                gap4,
                CustomTextField(
                  controller: _nameController,
                  hintText: '',
                  isCountryCodeNeeded: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  fillColor: ColorResources.secondaryColor,
                  borderColor: ColorResources.transparent,
                  borderRadius: 16,
                ),
                gap16,

                // Phone Number field
                Text(
                  'Alternate Number (Optional)',
                  style: context.textStyle1.w500.s14,
                ),
                gap4,
                CustomTextField(
                  controller: _phoneController,
                  hintText: '',
                  isCountryCodeNeeded: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  fillColor: ColorResources.secondaryColor,
                  borderColor: ColorResources.transparent,
                  borderRadius: 16,
                ),
                gap32,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButton(
          text: 'Add Address',
          onPressed: () {
            AppRoute.pop();
            AppRoute.pop();
          },
          backgroundColor: ColorResources.secondary,
          textStyle: context.textStyle1.w600.s24.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
