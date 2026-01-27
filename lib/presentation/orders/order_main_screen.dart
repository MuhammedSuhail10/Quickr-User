import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class OrderMainScreen extends StatelessWidget {
  const OrderMainScreen({super.key});

  static const routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 0,
        surfaceTintColor: ColorResources.transparent,
        leadingWidth: 40,
        title: Text('Orders', style: context.heading.w400.s24),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Scheduled Section
          Text('Scheduled', style: context.textStyle1.w600.s16),
          gap12,
          _buildScheduledCard(context),
          gap24,

          // Completed Section
          Text('Completed', style: context.textStyle1.w600.s16),
          gap12,
          _buildCompletedCards(context),
        ],
      ),
    );
  }

  Widget _buildScheduledCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Plumber', style: context.textStyle1.w300.s16),
              Text('11/05 10:56 PM', style: context.textStyle1.w300.s12),
            ],
          ),
          gap12,
          Container(
            decoration: BoxDecoration(
              color: ColorResources.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muhammed Suhail',
                            style: context.textStyle1.w500.s16.copyWith(
                              color: ColorResources.white,
                            ),
                          ),
                          gap4,
                          Row(
                            children: [
                              const Icon(
                                Icons.work_outline,
                                size: 16,
                                color: ColorResources.white,
                              ),
                              gap6,
                              Text(
                                '12yr',
                                style: context.textStyle1.w300.s14.copyWith(
                                  color: ColorResources.white,
                                ),
                              ),
                            ],
                          ),
                          gap4,
                          Row(
                            children: [
                              const Icon(
                                Icons.work_outline,
                                size: 16,
                                color: ColorResources.white,
                              ),
                              gap6,
                              Text(
                                '12yr',
                                style: context.textStyle1.w300.s14.copyWith(
                                  color: ColorResources.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    gap12,
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorResources.white,
                    ),
                  ],
                ),
                gap12,
                Text(
                  'Visit Scheduled for: 12/06\n11:00pm',
                  textAlign: TextAlign.center,
                  style: context.textStyle1.w300.s12.white,
                ),
              ],
            ),
          ),
          gap12,
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone, size: 18),
                label: const Text('Call'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: ColorResources.black,
                  side: const BorderSide(color: ColorResources.black),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Spacer(),
              _buildIconButton(AppAssets.edit, () {}),
              gap12,
              _buildIconButton(AppAssets.delete, () {}, isDelete: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedCards(BuildContext context) {
    // List of completed orders with showRateButton flag
    final completedOrders = [
      {'showRate': true},
      {'showRate': false},
      {'showRate': false},
    ];

    return Column(
      children: completedOrders.asMap().entries.map((entry) {
        final index = entry.key;
        final order = entry.value;
        return Column(
          children: [
            _buildCompletedCardItem(
              context,
              showRateButton: order['showRate'] as bool,
            ),
            if (index < completedOrders.length - 1) gap12,
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCompletedCardItem(
    BuildContext context, {
    required bool showRateButton,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Plumber', style: context.textStyle1.w300.s16),
                gap4,
                Text('11/05 10:56 PM', style: context.textStyle1.w300.s12),
                gap12,
                Row(
                  children: [
                    if (showRateButton) ...[
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.star_outline, size: 18),
                        label: const Text('Rate'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: ColorResources.black,
                          side: const BorderSide(color: ColorResources.black),
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      gap8,
                    ],
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh, size: 18),
                      label: const Text('Reschedule'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ColorResources.black,
                        side: const BorderSide(color: ColorResources.black),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          gap12,
          Container(
            decoration: BoxDecoration(
              color: ColorResources.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorResources.white,
                ),
                gap8,
                Text(
                  'Muhammed\nSahil',
                  textAlign: TextAlign.center,
                  style: context.textStyle1.w300.s14.white,
                ),
              ],
            ),
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
