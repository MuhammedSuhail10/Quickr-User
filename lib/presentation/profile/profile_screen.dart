import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/application/profile/profile_bloc.dart';
import 'package:quickr_user_flutter_app/domain/profile/models/profile_response.dart';
import 'package:quickr_user_flutter_app/presentation/profile/edit_email_address.dart';
import 'package:quickr_user_flutter_app/presentation/profile/edit_phone_number.dart';
import 'package:quickr_user_flutter_app/presentation/profile/profile_update_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = 'profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.getProfileData());
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
        title: Text('Profile', style: context.heading.w400.s24),
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
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final profile = state.profileResponse;
          return Column(
            children: [
              // Section 1: User Info
              _buildUserInfoSection(context, profile, state.getProfileStatus),
              gap4,
              // Section 2: Menu Options
              _buildMenuOptionsSection(context, profile),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUserInfoSection(
    BuildContext context,
    ProfileResponse? profile,
    ApiStatus status,
  ) {
    final fullName = status == ApiStatus.success
        ? '${profile?.firstName ?? ''} ${profile?.lastName ?? ''}'.trim()
        : 'User Name';
    const mediaBaseUrl = 'https://fixifybackend.pythonanywhere.com';

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Profile Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorResources.secondaryColor,
              image: profile?.profileImage != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$mediaBaseUrl${profile!.profileImage!}',
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          gap16,
          // User Name
          Text(
            fullName.isNotEmpty ? fullName : 'User Name',
            style: context.textStyle1.w600.s18,
          ),
          // Phone Number
          Text(
            profile?.phoneNumber ?? 'Phone number',
            style: const TextStyle(fontSize: 14, color: ColorResources.black),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOptionsSection(
    BuildContext context,
    ProfileResponse? profile,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          if (profile?.emailVerified == false)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Email is not verified, ',
                  style: TextStyle(fontSize: 14, color: ColorResources.black),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'verify email',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorResources.primary,
                    ),
                  ),
                ),
              ],
            ),
          gap12,
          _buildMenuItem(
            icon: Icons.phone_outlined,
            title: 'Change Phone Number',
            onTap: () {
              AppRoute.pushNamed(EditPhoneNumber.routeName);
            },
            context: context,
          ),
          gap16,
          _buildMenuItem(
            icon: Icons.email_outlined,
            title: 'Change Email Address',
            onTap: () {
              AppRoute.pushNamed(EditEmailAddress.routeName);
            },
            context: context,
          ),
          gap16,
          _buildMenuItem(
            icon: Icons.edit_outlined,
            title: 'Change Other Details',
            onTap: () {
              AppRoute.pushNamed(
                ProfileUpdateScreen.routeName,
                arguments: {
                  'name': '${profile?.firstName} ${profile?.lastName}',
                  'imageUrl': profile?.profileImage ?? '',
                },
              );
            },
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    BuildContext? context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: ColorResources.textColor, size: 24),
        title: Text(title, style: context!.textStyle1.w300.s12),
        trailing: const Icon(
          Icons.chevron_right,
          color: ColorResources.grey,
          size: 30,
        ),
        onTap: onTap,
      ),
    );
  }
}
