import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/address/address_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/extra_information_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/location_selecting_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

import 'package:quickr_user_flutter_app/domain/booking/models/service_item.dart';

class ServiceBookingScreen extends StatefulWidget {
  final List<ServiceItem>? services;
  final bool? isImmediate;
  final String? scheduledDate;
  final String? scheduledTime;

  const ServiceBookingScreen({
    super.key,
    this.services,
    this.isImmediate,
    this.scheduledDate,
    this.scheduledTime,
  });

  static const routeName = 'service-booking';

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen> {
  int? selectedAddressId;

  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(const AddressEvent.getAddress());
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
              child: Text('2/3', style: context.textStyle1.w300.s14),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Address', style: context.textStyle1.w300.s14),
                  gap16,
                  BlocBuilder<AddressBloc, AddressState>(
                    builder: (context, state) {
                      if (state.getAddressStatus == ApiStatus.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final addresses = state.addressResponse?.address ?? [];

                      if (addresses.isEmpty &&
                          state.getAddressStatus == ApiStatus.success) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text('No saved addresses')),
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: addresses.length,
                        separatorBuilder: (context, index) => gap16,
                        itemBuilder: (context, index) {
                          final address = addresses[index];
                          final isSelected = selectedAddressId == address.id;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAddressId = address.id;
                              });
                            },
                            child: _AddressCard(
                              label: address.alternateName ?? 'N/A',
                              address:
                                  '${address.addressLine1 ?? ''},\n${address.landmark ?? ''},\n${address.postalCode ?? ''}',
                              isSelected: isSelected,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  gap24,
                  // Add New Address Button
                  CommonButton(
                    text: 'Add New Address',
                    textStyle: context.textStyle1.w700.s20.copyWith(
                      color: ColorResources.primary,
                    ),
                    backgroundColor: ColorResources.secondaryColor,
                    borderWidth: 1,
                    onPressed: () {
                      AppRoute.pushNamed(LocationSelectingScreen.routeName);
                    },
                  ),
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
            if (selectedAddressId != null) {
              AppRoute.pushNamed(
                ExtraInformationScreen.routeName,
                arguments: {
                  'addressid': selectedAddressId,
                  'services': widget.services,
                  'isImmediate': widget.isImmediate,
                  'scheduledDate': widget.scheduledDate,
                  'scheduledTime': widget.scheduledTime,
                },
              );
            } else {
              CustomAlertDialog.showCustomDialog(
                title: 'Please select an address',
                typeAlert: TypeAlert.warning,
              );
            }
          },
          backgroundColor: ColorResources.secondary,
          textStyle: context.textStyle1.w600.s24.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String label;
  final String address;
  final bool isSelected;

  const _AddressCard({
    required this.label,
    required this.address,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.isNotEmpty ? label : 'Unknown label',
                  style: context.textStyle1.w300.s14,
                ),
                gap8,
                Text(address, style: context.textStyle1.w300.s12),
              ],
            ),
          ),
          gap12,
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? ColorResources.primary : ColorResources.white,
              border: isSelected
                  ? null
                  : Border.all(color: ColorResources.primary, width: 1),
            ),
            child: isSelected
                ? const Icon(Icons.check, size: 16, color: ColorResources.white)
                : null,
          ),
        ],
      ),
    );
  }
}
