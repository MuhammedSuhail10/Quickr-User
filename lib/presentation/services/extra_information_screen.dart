import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickr_user_flutter_app/application/booking/booking_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/domain/booking/models/booking_request.dart';
import 'package:quickr_user_flutter_app/domain/booking/models/service_item.dart';
import 'package:quickr_user_flutter_app/presentation/services/booking_success_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

class ExtraInformationScreen extends StatefulWidget {
  final int? addressid;
  final List<ServiceItem>? services;
  final bool? isImmediate;
  final String? scheduledDate;
  final String? scheduledTime;

  const ExtraInformationScreen({
    super.key,
    this.addressid,
    this.services,
    this.isImmediate,
    this.scheduledDate,
    this.scheduledTime,
  });

  static const routeName = 'extra-information';

  @override
  State<ExtraInformationScreen> createState() => _ExtraInformationScreenState();
}

class _ExtraInformationScreenState extends State<ExtraInformationScreen> {
  File? _image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Select Image Source', style: context.textStyle1.w600.s18),
            gap20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SourceOption(
                  icon: Icons.camera_alt_outlined,
                  label: 'Camera',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                _SourceOption(
                  icon: Icons.image_outlined,
                  label: 'Gallery',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            gap20,
          ],
        ),
      ),
    );
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
      body: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state.createOrderStatus == ApiStatus.success) {
            CustomAlertDialog.showCustomDialog(
              title: 'Order created successfully',
              typeAlert: TypeAlert.success,
            );
            AppRoute.pushNamedAndRemoveUntil(BookingSuccessScreen.routeName);
          } else if (state.createOrderStatus == ApiStatus.error) {
            CustomAlertDialog.showCustomDialog(
              title: state.errorMessage ?? 'Failed to create order',
              typeAlert: TypeAlert.error,
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Extra Information',
                        style: context.textStyle1.w300.s18,
                      ),
                      gap8,
                      Text('Upload image', style: context.textStyle1.w300.s14),
                      gap4,
                      if (_image != null)
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                _image!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () => setState(() => _image = null),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: ColorResources.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: ColorResources.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        GestureDetector(
                          onTap: _showImageSourceDialog,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorResources.secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.cloud_upload_outlined,
                                  color: ColorResources.primary,
                                  size: 32,
                                ),
                                gap8,
                                Text(
                                  'Tap to upload image',
                                  style: context.textStyle1.w300.s14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      gap16,
                      Text('Name', style: context.textStyle1.w300.s14),
                      gap4,
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Name',
                        isCountryCodeNeeded: false,
                        fillColor: ColorResources.secondaryColor,
                        borderColor: ColorResources.transparent,
                        borderRadius: 15,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),
                      gap16,
                      Text(
                        'Alternate Number (Optional)',
                        style: context.textStyle1.w300.s14,
                      ),
                      gap4,
                      CustomTextField(
                        controller: _phoneController,
                        hintText: 'Alternate Number ',
                        isCountryCodeNeeded: false,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        fillColor: ColorResources.secondaryColor,
                        borderColor: ColorResources.transparent,
                        borderRadius: 15,
                      ),
                      gap16,
                      Text('Notes', style: context.textStyle1.w300.s14),
                      gap4,
                      CustomTextField(
                        controller: _notesController,
                        hintText: 'Notes',
                        isCountryCodeNeeded: false,
                        fillColor: ColorResources.secondaryColor,
                        borderColor: ColorResources.transparent,
                        maxLines: 6,
                        borderRadius: 15,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter notes';
                          }
                          return null;
                        },
                      ),
                      gap90,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<BookingBloc, BookingState>(
          builder: (context, state) {
            return CommonButton(
              text: 'Complete',
              isLoading: state.createOrderStatus == ApiStatus.loading,
              onPressed: () {
                if (_image == null) {
                  CustomAlertDialog.showCustomDialog(
                    title: 'Please upload an image',
                    typeAlert: TypeAlert.warning,
                  );
                  return;
                }
                if (formKey.currentState!.validate()) {
                  final request = BookingRequest(
                    workImage: _image!,
                    services: widget.services ?? [],
                    isImmediate: widget.isImmediate ?? false,
                    scheduledDate: widget.scheduledDate,
                    scheduledTime: widget.scheduledTime,
                    addressId: widget.addressid ?? 0,
                    alternateName: _nameController.text,
                    alternatePhoneNumber: _phoneController.text,
                    notes: _notesController.text,
                  );

                  context.read<BookingBloc>().add(
                    BookingEvent.createOrder(request: request),
                  );
                }
              },
              backgroundColor: ColorResources.secondary,
              textStyle: context.textStyle1.w600.s24.white,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _SourceOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SourceOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorResources.secondaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: ColorResources.primary, size: 30),
          ),
          gap8,
          Text(label, style: context.textStyle1.w300.s14),
        ],
      ),
    );
  }
}
