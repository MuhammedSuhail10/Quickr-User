import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_booking_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({super.key});

  static const routeName = 'service-selection';

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  final List<Map<String, dynamic>> services = [
    {'title': 'General\nPlumbing\nWorks', 'isSelected': true},
    {'title': 'Leakage', 'isSelected': false},
    {'title': 'General\nPlumbing\nWorks', 'isSelected': true},
    {'title': 'Leakage', 'isSelected': false},
  ];

  bool isScheduleSelected = false;

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
              child: Text('1/3', style: context.textStyle1.w300.s14),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete the details to book your service',
                    style: context.textStyle1.w300.s14,
                  ),
                  gap24,
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorResources.scaffoldBackground2.withOpacity(
                        0.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select the service you are looking for?',
                          style: context.textStyle1.w300.s12,
                        ),
                        gap16,
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.9,
                              ),
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  services[index]['isSelected'] =
                                      !services[index]['isSelected'];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: ColorResources.scaffoldBackground2,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        services[index]['title'],
                                        style: context.textStyle1.w300.s12
                                            .copyWith(height: 1.3),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: services[index]['isSelected']
                                              ? ColorResources.primary
                                              : ColorResources.white,
                                          // border: Border.all(
                                          //   color: services[index]['isSelected']
                                          //       ? ColorResources.primary
                                          //       : Colors.grey[400]!,
                                          //   width: 2,
                                          // ),
                                        ),
                                        child: services[index]['isSelected']
                                            ? const Icon(
                                                Icons.check,
                                                color: ColorResources.white,
                                                size: 16,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  gap24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isScheduleSelected)
                        Text('Schedule', style: context.textStyle1.w300.s14),
                      if (!isScheduleSelected) const SizedBox.shrink(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isScheduleSelected = !isScheduleSelected;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: ColorResources.secondary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            isScheduleSelected ? 'Immediate' : 'Schedule',
                            style: context.textStyle1.w300.s12.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isScheduleSelected) ...[
                    gap16,
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ColorResources.scaffoldBackground2.withOpacity(
                          0.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose date & time',
                            style: context.textStyle1.w300.s12,
                          ),
                          gap12,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: ColorResources.scaffoldBackground2,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Today',
                                  style: context.textStyle1.w300.s12,
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: ColorResources.grey,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                          gap12,
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 24,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.scaffoldBackground2,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    '12',
                                    style: context.textStyle1.w300.s16,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              gap12,
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 24,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.scaffoldBackground2,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    '30',
                                    style: context.textStyle1.w300.s16,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  gap100,
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButton(
          text: 'Next',
          onPressed: () {
            AppRoute.pushNamed(ServiceBookingScreen.routeName);
          },
          backgroundColor: ColorResources.secondary,
          textStyle: context.textStyle1.w600.s24.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
