import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  static const routeName = 'service-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 0,
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: ColorResources.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text('Plumber', style: context.heading.w400.s24),
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Image
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        color: ColorResources.secondaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    gap24,
                    // Plumbing Services Title
                    Text(
                      'Plumbing Services',
                      style: context.textStyle1.w600.s22,
                    ),
                    gap16,
                    // Services Grid
                    _buildServiceCards(),
                  ],
                ),
              ),
            ),
          ),

          // Book Now Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CommonButton(
              text: 'Book Now',
              onPressed: () {},
              backgroundColor: ColorResources.secondary,
              textStyle: context.textStyle1.w600.s24.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCards() {
    final services = [
      'General\nPlumbing Works',
      'Installation',
      'Leakages',
      'Leakages',
      'Leakages',
      'Repairs',
      'Repairs',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.95,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: ColorResources.secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(services[index], style: context.textStyle1.w300.s12),
            ),
          ),
        );
      },
    );
  }
}
