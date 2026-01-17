import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_details_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class ServiceMainScreen extends StatelessWidget {
  const ServiceMainScreen({super.key});

  // List of all services
  final List<Map<String, dynamic>> services = const [
    {'title': 'Plumber', 'imagePath': AppAssets.plumber},
    {'title': 'Electrician', 'imagePath': AppAssets.electrician},
    {'title': 'Carpenter', 'imagePath': null},
    {'title': 'Painter', 'imagePath': null},
    {'title': 'Cleaner', 'imagePath': null},
    {'title': 'Gardener', 'imagePath': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Services', style: context.heading.w400.s24),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for services',
                    hintStyle: context.textStyle1.w300.s12,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        AppAssets.search,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ),
            gap20,
            // Service Cards Grid
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Service Cards Grid
                    GestureDetector(
                      onTap: () {
                        AppRoute.pushNamed(ServiceDetailsScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _buildServiceCard(),
                      ),
                    ),
                    // Suggestion Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              gap16,
                              Text(
                                "Couldn't find what you\nare looking for, let us\nknow...",
                                style: context.heading.w400.s24,
                              ),
                            ],
                          ),
                          gap12,
                          CommonButton(
                            text: 'Suggest',
                            textStyle: context.textStyle1.w700.s24.copyWith(
                              color: ColorResources.primary,
                            ),
                            backgroundColor: ColorResources.secondaryColor,
                            borderWidth: 1,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 0.85,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        final imagePath = service['imagePath'];

        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              color: imagePath == null ? ColorResources.secondary : null,
              image: imagePath != null
                  ? DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Stack(
              children: [
                // Semi-transparent overlay for better text visibility
                // Container(
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       colors: [
                //         ColorResources.transparent,
                //         ColorResources.black.withOpacity(0.3),
                //       ],
                //     ),
                //   ),
                // ),

                // Title at bottom
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      service['title'],
                      style: context.textStyle1.w300.s14.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
