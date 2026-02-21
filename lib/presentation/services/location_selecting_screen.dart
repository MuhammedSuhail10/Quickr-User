import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/services/add_new_address.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class LocationSelectingScreen extends StatefulWidget {
  const LocationSelectingScreen({super.key});

  static const routeName = 'location-selecting';

  @override
  State<LocationSelectingScreen> createState() =>
      _LocationSelectingScreenState();
}

class _LocationSelectingScreenState extends State<LocationSelectingScreen> {
  LatLng? selectedLocation;
  final MapController mapController = MapController();

  // Starting position (example: Nashik as referenced in previous screens)
  static const LatLng initialCenter = LatLng(9.9816, 76.2999);

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
        title: Text('Add Address Details', style: context.heading.w400.s24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: initialCenter,
              initialZoom: 13.0,
              onTap: (tapPosition, point) {
                setState(() {
                  selectedLocation = point;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.quickr.user',
              ),
              if (selectedLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: selectedLocation!,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonButton(
          text: 'Confirm Location',
          onPressed: () {
            if (selectedLocation != null) {
              AppRoute.pushNamed(
                AddNewAddress.routeName,
                arguments: {
                  'latitude': selectedLocation!.latitude,
                  'longitude': selectedLocation!.longitude,
                },
              );
            } else {
              CustomAlertDialog.showCustomDialog(
                title: 'Please select a location on the map',
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
