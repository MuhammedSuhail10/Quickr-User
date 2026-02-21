import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickr_user_flutter_app/application/address/address_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/domain/address/models/address_response.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_textfield.dart';

class AddNewAddress extends StatefulWidget {
  final double? latitude;
  final double? longitude;

  const AddNewAddress({super.key, this.latitude, this.longitude});

  static const routeName = 'add-new-address';

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  final _houseNoController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _postalcodeController = TextEditingController();

  @override
  void dispose() {
    _houseNoController.dispose();
    _landmarkController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _postalcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listenWhen: (previous, current) =>
          previous.addAddressStatus != current.addAddressStatus,
      listener: (context, state) {
        if (state.addAddressStatus == ApiStatus.success) {
          CustomAlertDialog.showCustomDialog(
            title: 'Address added successfully',
            typeAlert: TypeAlert.success,
          );
          context.read<AddressBloc>().add(const AddressEvent.getAddress());
          AppRoute.pop();
          AppRoute.pop();
        } else if (state.addAddressStatus == ApiStatus.error) {
          CustomAlertDialog.showCustomDialog(
            title: state.errorMessage ?? 'Failed to add address',
            typeAlert: TypeAlert.error,
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
          title: Text('Add Address Details', style: context.heading.w400.s24),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Map placeholder container
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(
                            widget.latitude ?? 9.9816,
                            widget.longitude ?? 76.2999,
                          ),
                          initialZoom: 15.0,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.quickr.user',
                          ),
                          if (widget.latitude != null &&
                              widget.longitude != null)
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(
                                    widget.latitude!,
                                    widget.longitude!,
                                  ),
                                  width: 80,
                                  height: 80,
                                  child: const Icon(
                                    Icons.location_on,
                                    color: ColorResources.red,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  gap24,
                  Text('Add Address', style: context.textStyle1.w600.s18),
                  gap16,
                  // House No/ Name field
                  Text('House No/ Name', style: context.textStyle1.w500.s14),
                  gap4,
                  CustomTextField(
                    controller: _houseNoController,
                    hintText: '',
                    isCountryCodeNeeded: false,
                    keyboardType: TextInputType.text,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    borderRadius: 16,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter house no/name';
                      }
                      return null;
                    },
                  ),
                  gap16,
                  // Landmark field
                  Text('Landmark', style: context.textStyle1.w500.s14),
                  gap4,
                  CustomTextField(
                    controller: _landmarkController,
                    hintText: '',
                    isCountryCodeNeeded: false,
                    keyboardType: TextInputType.text,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    borderRadius: 16,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter landmark';
                      }
                      return null;
                    },
                  ),
                  gap16,
                  // Postal Code field
                  Text('Postal Code', style: context.textStyle1.w500.s14),
                  gap4,
                  CustomTextField(
                    controller: _postalcodeController,
                    hintText: '',
                    isCountryCodeNeeded: false,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    borderRadius: 16,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter postal code';
                      }
                      return null;
                    },
                  ),
                  gap16,
                  // Alternate Number & Name section
                  Text('Name (Optional)', style: context.textStyle1.w500.s14),
                  gap4,
                  CustomTextField(
                    controller: _nameController,
                    hintText: '',
                    isCountryCodeNeeded: false,
                    keyboardType: TextInputType.name,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    borderRadius: 16,
                  ),
                  gap16,
                  // Phone Number field
                  Text(
                    'Alternate Number (Optional)',
                    style: context.textStyle1.w500.s14,
                  ),
                  gap4,
                  CustomTextField(
                    controller: _phoneController,
                    hintText: '',
                    isCountryCodeNeeded: false,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    fillColor: ColorResources.secondaryColor,
                    borderColor: ColorResources.transparent,
                    borderRadius: 16,
                  ),
                  gap100,
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              return CommonButton(
                text: 'Add Address',
                isLoading: state.addAddressStatus == ApiStatus.loading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final address = Address(
                      districtId: 1,
                      addressLine1: _houseNoController.text,
                      landmark: _landmarkController.text,
                      latitude: widget.latitude,
                      longitude: widget.longitude,
                      postalCode: _postalcodeController.text,
                      alternateName: _nameController.text,
                      alternatePhoneNumber: _phoneController.text,
                    );
                    context.read<AddressBloc>().add(
                      AddressEvent.addAddress(address),
                    );
                  }
                },
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
