import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_booking_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/home/home_bloc.dart';
import 'package:quickr_user_flutter_app/presentation/services/widgets/service_category_list_widget.dart';
import 'package:intl/intl.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/booking/models/service_item.dart';

class ServiceSelectionScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  const ServiceSelectionScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  static const routeName = 'service-selection';

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  bool isScheduleSelected = false;
  bool isImmediate = true;
  DateTime? scheduledDate;
  TimeOfDay? scheduledTime;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
      HomeEvent.getSubCategoryServices(categoryId: widget.categoryId),
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
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorResources.black,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(widget.categoryName, style: context.heading.w400.s24),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text('1/3', style: context.textStyle1.w300.s14),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.getSubCategoryServicesStatus == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.getSubCategoryServicesStatus == ApiStatus.error) {
            return Center(
              child: Text(
                state.errorMessage ?? 'Something went wrong',
                style: context.textStyle1.w300.s14,
              ),
            );
          }

          final subcategories = state.serviceResponse?.data ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          color: ColorResources.secondaryColor,
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://img.freepik.com/free-photo/construction-tools-wooden-table_23-2148110300.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      gap24,
                      Text(
                        'Complete the details to book your service',
                        style: context.textStyle1.w300.s14,
                      ),
                      gap16,
                      // Subcategory & Services section
                      if (subcategories.isEmpty)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Text(
                              'No services found',
                              style: context.textStyle1.w300.s14,
                            ),
                          ),
                        )
                      else
                        ServiceCategoryListWidget(subcategories: subcategories),
                      gap90,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CommonButton(
              text: 'Book Now',
              onPressed: () {
                final subcategories = state.serviceResponse?.data ?? [];
                bool atLeastOneSelected = false;

                for (var sub in subcategories) {
                  if (sub.services != null) {
                    for (var service in sub.services!) {
                      if (service.quantity > 0) {
                        atLeastOneSelected = true;
                        break;
                      }
                    }
                  }
                  if (atLeastOneSelected) break;
                }

                if (atLeastOneSelected) {
                  final List<ServiceItem> selectedServices = [];
                  for (var sub in subcategories) {
                    if (sub.services != null) {
                      for (var service in sub.services!) {
                        if (service.quantity > 0) {
                          selectedServices.add(
                            ServiceItem(
                              serviceId: service.id ?? 0,
                              quantity: service.quantity,
                            ),
                          );
                        }
                      }
                    }
                  }

                  _showBookingTimingBottomSheet(selectedServices);
                } else {
                  CustomAlertDialog.showCustomDialog(
                    title: 'Please select at least one service to proceed',
                    typeAlert: TypeAlert.warning,
                  );
                }
              },
              backgroundColor: ColorResources.secondary,
              textStyle: context.textStyle1.w600.s24.white,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showBookingTimingBottomSheet(List<ServiceItem> selectedServices) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: ColorResources.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  gap24,
                  Text(
                    'When do you want the service?',
                    style: context.textStyle1.w600.s18,
                  ),
                  gap16,
                  // Immediate Choice
                  GestureDetector(
                    onTap: () {
                      setModalState(() {
                        isImmediate = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isImmediate
                            ? ColorResources.primary.withOpacity(0.1)
                            : ColorResources.secondaryColor,
                        borderRadius: BorderRadius.circular(15),
                        border: isImmediate
                            ? Border.all(color: ColorResources.primary)
                            : null,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isImmediate
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: ColorResources.primary,
                          ),
                          gap12,
                          Text('Immediate', style: context.textStyle1.w300.s16),
                        ],
                      ),
                    ),
                  ),
                  gap12,
                  // Schedule Choice
                  GestureDetector(
                    onTap: () {
                      setModalState(() {
                        isImmediate = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: !isImmediate
                            ? ColorResources.primary.withOpacity(0.1)
                            : ColorResources.secondaryColor,
                        borderRadius: BorderRadius.circular(15),
                        border: !isImmediate
                            ? Border.all(color: ColorResources.primary)
                            : null,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            !isImmediate
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: ColorResources.primary,
                          ),
                          gap12,
                          Text(
                            'Schedule for later',
                            style: context.textStyle1.w300.s16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isImmediate) ...[
                    gap16,
                    Row(
                      children: [
                        // Date Picker
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 30),
                                ),
                              );
                              if (picked != null) {
                                setModalState(() {
                                  scheduledDate = picked;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: ColorResources.secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                    color: ColorResources.primary,
                                  ),
                                  gap8,
                                  Text(
                                    scheduledDate != null
                                        ? DateFormat(
                                            'dd/MM/yyyy',
                                          ).format(scheduledDate!)
                                        : 'Select Date',
                                    style: context.textStyle1.w300.s14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        gap12,
                        // Time Picker
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null) {
                                setModalState(() {
                                  scheduledTime = picked;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: ColorResources.secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: ColorResources.primary,
                                  ),
                                  gap8,
                                  Text(
                                    scheduledTime != null
                                        ? scheduledTime!.format(context)
                                        : 'Select Time',
                                    style: context.textStyle1.w300.s14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  gap24,
                  CommonButton(
                    text: 'Confirm Timing',
                    onPressed: () {
                      if (!isImmediate &&
                          (scheduledDate == null || scheduledTime == null)) {
                        CustomAlertDialog.showCustomDialog(
                          title: 'Please select both date and time',
                          typeAlert: TypeAlert.warning,
                        );
                        return;
                      }

                      Navigator.pop(context);
                      AppRoute.pushNamed(
                        ServiceBookingScreen.routeName,
                        arguments: {
                          'services': selectedServices,
                          'isImmediate': isImmediate,
                          'scheduledDate': scheduledDate != null
                              ? DateFormat('yyyy-MM-dd').format(scheduledDate!)
                              : null,
                          'scheduledTime': scheduledTime != null
                              ? '${scheduledTime!.hour.toString().padLeft(2, '0')}:${scheduledTime!.minute.toString().padLeft(2, '0')}'
                              : null,
                        },
                      );
                    },
                    backgroundColor: ColorResources.secondary,
                    textStyle: context.textStyle1.w600.s20.white,
                  ),
                  gap16,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
