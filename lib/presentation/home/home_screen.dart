import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: ColorResources.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset(AppAssets.logo, height: 30, width: 30),
              onPressed: () {},
            ),
            const Spacer(),
            Row(
              children: [
                Text('Kochi', style: context.textStyle1.w300.s16),
                gap4,
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: ColorResources.black,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Service Categories Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                  children: [
                    _buildServiceCard('Plumber', AppAssets.plumber, context),
                    _buildServiceCard(
                      'Electrician',
                      AppAssets.electrician,
                      context,
                    ),
                    _buildServiceCard('Cook', null, context),
                    _buildServiceCard('Plumber', AppAssets.plumber, context),
                    _buildServiceCard(
                      'Electrician',
                      AppAssets.electrician,
                      context,
                    ),
                    _buildServiceCard('More\nServices', null, context),
                  ],
                ),
                gap24,
                // Top Services Section
                Text('Top services', style: context.textStyle1.bold.s20),
                gap16,
                // Top Services Cards
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                          color: ColorResources.secondary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    gap12,
                    Expanded(
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                          color: ColorResources.secondary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
                gap24,

                // Promotional Text
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      letterSpacing: 0.5,
                    ),
                    children: [
                      TextSpan(text: 'Hire ', style: context.heading.w400.s24),
                      TextSpan(
                        text: 'professionals',
                        style: context.heading.w400.s24.copyWith(
                          color: const Color(0XFF69AE95),
                        ),
                      ),
                      TextSpan(
                        text: ' in a\nclick...',
                        style: context.heading.w400.s24,
                      ),
                    ],
                  ),
                ),
                gap4,
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      letterSpacing: 0.5,
                    ),
                    children: [
                      TextSpan(text: 'Get ', style: context.heading.w400.s24),
                      TextSpan(
                        text: 'services',
                        style: context.heading.w400.s24.copyWith(
                          color: const Color(0XFF69AE95),
                        ),
                      ),
                      TextSpan(
                        text: ' at your\ndoorstep...',
                        style: context.heading.w400.s24,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    String? imagePath,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: imagePath == null ? ColorResources.secondary : null,
        borderRadius: BorderRadius.circular(25),
        image: imagePath != null
            ? DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
            : null,
      ),
      child: Column(
        children: [
          const Spacer(),
          // Shadow container for title
          imagePath != null
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: ColorResources.black.withOpacity(0.35),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Text(title, style: context.textStyle1.w300.s14.white),
                )
              : Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      title,
                      style: context.textStyle1.w300.s14.white,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
