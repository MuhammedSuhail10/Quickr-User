import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:image_picker/image_picker.dart';
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

class ProfileUpdateScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  const ProfileUpdateScreen({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  static const routeName = 'profile-update';

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController _nameController = TextEditingController();
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
  }

  @override
  void didChangeDependencies() {
    _profileBloc = context.read<ProfileBloc>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    // Reset update status when screen is closed
    _profileBloc.add(const ProfileEvent.resetUpdateProfileStatus());
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImage != null) {
      setState(() {
        _imageFile = selectedImage;
      });
    }
  }

  void _handleUpdate() {
    final fullName = _nameController.text.trim();
    if (fullName.isEmpty) {
      CustomAlertDialog.showCustomDialog(
        title: 'Please enter your name',
        typeAlert: TypeAlert.warning,
      );
      return;
    }

    // Split name into first and last name
    final nameParts = fullName.split(' ');
    String firstName = nameParts[0];
    String lastName = nameParts.length > 1
        ? nameParts.sublist(1).join(' ')
        : '';

    context.read<ProfileBloc>().add(
      ProfileEvent.updateProfile(
        firstName: firstName,
        lastName: lastName,
        profileImage: _imageFile != null ? File(_imageFile!.path) : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const mediaBaseUrl = 'https://fixifybackend.pythonanywhere.com';
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.updateProfileStatus == ApiStatus.success) {
          CustomAlertDialog.showCustomDialog(
            title: 'Profile updated successfully',
            typeAlert: TypeAlert.success,
          );
          // Refresh profile data
          context.read<ProfileBloc>().add(const ProfileEvent.getProfileData());
          context.read<ProfileBloc>().add(
            const ProfileEvent.resetUpdateProfileStatus(),
          );
          // Success navigation back
          AppRoute.pop();
        } else if (state.updateProfileStatus == ApiStatus.error) {
          CustomAlertDialog.showCustomDialog(
            title: state.errorMessage ?? 'Failed to update profile',
            typeAlert: TypeAlert.error,
          );
          // Reset status so alert doesn't show again on rebuild
          context.read<ProfileBloc>().add(
            const ProfileEvent.resetUpdateProfileStatus(),
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
          title: Text('Profile', style: context.heading.w400.s24),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              Text('Profile Picture', style: context.textStyle1.w500.s14),
              gap16,
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorResources.secondaryColor,
                          image: _imageFile != null
                              ? DecorationImage(
                                  image: FileImage(File(_imageFile!.path)),
                                  fit: BoxFit.cover,
                                )
                              : widget.imageUrl.isNotEmpty
                              ? DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    '$mediaBaseUrl${widget.imageUrl}',
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: (_imageFile == null && widget.imageUrl.isEmpty)
                            ? const Icon(
                                Icons.person,
                                size: 100,
                                color: ColorResources.white,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorResources.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: ColorResources.secondary,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              gap32,
              // Name Field Section
              Text('Name', style: context.textStyle1.w500.s14),
              gap4,
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your name',
                isCountryCodeNeeded: false,
                keyboardType: TextInputType.text,
                fillColor: ColorResources.secondaryColor,
                borderColor: ColorResources.transparent,
                borderRadius: 16,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return CommonButton(
                text: 'Update',
                isLoading: state.updateProfileStatus == ApiStatus.loading,
                onPressed: _handleUpdate,
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
