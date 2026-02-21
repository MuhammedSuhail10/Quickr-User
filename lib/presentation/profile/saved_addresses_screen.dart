import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/address/address_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  static const routeName = 'saved-address';

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
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
        title: Text('Saved Addresses', style: context.heading.w400.s24),
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
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state.getAddressStatus == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final addresses = state.addressResponse?.address ?? [];

          if (addresses.isEmpty &&
              state.getAddressStatus == ApiStatus.success) {
            return Center(
              child: Text(
                'No saved addresses',
                style: context.textStyle1.w400.s16,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _AddressCard(
                  label: address.alternateName ?? 'Home',
                  address:
                      '${address.addressLine1 ?? ''},\n${address.landmark ?? ''},\n${address.postalCode ?? ''}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String label;
  final String address;

  const _AddressCard({required this.label, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.isNotEmpty ? label : 'Unknown label',
                  style: context.textStyle1.w400.s14,
                ),
                gap8,
                Text(address, style: context.textStyle1.w300.s12),
              ],
            ),
          ),
          gap12,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(AppAssets.edit, () {}),
              gap12,
              _buildIconButton(AppAssets.delete, () {}, isDelete: true),
            ],
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
