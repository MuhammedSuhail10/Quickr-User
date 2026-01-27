import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/auth/login_screen.dart';
import 'package:quickr_user_flutter_app/presentation/orders/order_main_screen.dart';
import 'package:quickr_user_flutter_app/presentation/profile/profile_screen.dart';
import 'package:quickr_user_flutter_app/presentation/profile/saved_addresses_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 0,
        surfaceTintColor: ColorResources.transparent,
        leadingWidth: 40,
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // User Profile Section
          _buildUserProfile(context),
          gap24,

          // Profile Information Section
          _buildProfileInformationSection(context),
          gap24,

          // Other Information Section
          _buildOtherInformationSection(context),
          gap24,

          // Logout Button Section
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: ColorResources.secondaryColor.withOpacity(0.8),
        ),
        gap16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Muhammed Suhail', style: context.textStyle1.w400.s18),
            // gap4,
            Text('+919048089432', style: context.textStyle1.w400.s14),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileInformationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Profile Information', style: context.textStyle1.w300.s16),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.secondaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              _buildMenuItem(
                context,
                icon: Icons.shopping_bag_outlined,
                title: 'Your Orders',
                onTap: () {
                  AppRoute.pushNamed(OrderMainScreen.routeName);
                },
              ),
              _buildDivider(),
              _buildMenuItem(
                context,
                icon: Icons.location_on_outlined,
                title: 'Saved Addresses',
                onTap: () {
                  AppRoute.pushNamed(SavedAddressesScreen.routeName);
                },
              ),
              _buildDivider(),
              _buildMenuItem(
                context,
                icon: Icons.person_outline,
                title: 'Profile',
                onTap: () {
                  AppRoute.pushNamed(ProfileScreen.routeName);
                },
              ),
              _buildDivider(),
              _buildMenuItem(
                context,
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOtherInformationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Other Information', style: context.textStyle1.w300.s16),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.secondaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              _buildMenuItem(
                context,
                icon: Icons.lightbulb_outline,
                title: 'Suggestions',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                context,
                icon: Icons.edit_note_outlined,
                title: 'Contact Us',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                context,
                icon: Icons.info_outline,
                title: 'General Info',
                onTap: () {},
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return CommonButton(
      text: 'Logout',
      onPressed: () {
        AppRoute.pushNamed(LoginScreen.routeName);
      },
      backgroundColor: ColorResources.secondary,
      textStyle: context.textStyle1.w600.s24.white,
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.vertical(
        top: isLast ? Radius.zero : const Radius.circular(16),
        bottom: isLast ? const Radius.circular(16) : Radius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: ColorResources.black),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: context.body.w400.s16)),
            const Icon(
              Icons.chevron_right,
              size: 30,
              color: ColorResources.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        height: 1,
        thickness: 1,
        color: ColorResources.textColor.withOpacity(0.2),
      ),
    );
  }
}
