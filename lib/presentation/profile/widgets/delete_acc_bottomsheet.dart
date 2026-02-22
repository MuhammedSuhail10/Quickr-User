import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/address/address_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  final int addressId;
  const DeleteAccountBottomSheet({super.key, required this.addressId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.deleteAddressStatus == ApiStatus.success) {
          CustomAlertDialog.showCustomDialog(
            title: 'Address deleted successfully',
            typeAlert: TypeAlert.success,
          );
          context.read<AddressBloc>()
            ..add(const AddressEvent.resetDeleteAddressStatus())
            ..add(const AddressEvent.getAddress());
          Navigator.pop(context, true);
        } else if (state.deleteAddressStatus == ApiStatus.error) {
          CustomAlertDialog.showCustomDialog(
            title: state.errorMessage ?? 'Failed to delete address',
            typeAlert: TypeAlert.error,
          );
          context.read<AddressBloc>().add(
            const AddressEvent.resetDeleteAddressStatus(),
          );
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.delete1, height: 60, width: 60),
              gap16,
              // Title
              Text(
                'Confirm Account Deletion?',
                style: context.textStyle1.bold.s20,
              ),
              gap16,
              // Description
              Text(
                'Are you sure do you want\nto delete your account',
                textAlign: TextAlign.center,
                style: context.hintText.w300.s12,
              ),
              gap32,
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: CommonButton(
                      text: 'Cancel',
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      textStyle: context.textStyle1.s14.w400.red,
                      borderColor: ColorResources.red,
                      backgroundColor: ColorResources.white,
                    ),
                  ),
                  gap16,
                  // Delete Button
                  Expanded(
                    child: BlocBuilder<AddressBloc, AddressState>(
                      builder: (context, state) {
                        return CommonButton(
                          text: 'Confirm',
                          isLoading:
                              state.deleteAddressStatus == ApiStatus.loading,
                          onPressed: () {
                            context.read<AddressBloc>().add(
                              AddressEvent.deleteAddress(addressId),
                            );
                          },
                          backgroundColor: ColorResources.red,
                          borderColor: ColorResources.transparent,
                          textStyle: context.textStyle1.s14.w400.white,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
