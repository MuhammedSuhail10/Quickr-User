import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/domain/auth_local/i_auth_local_facade.dart';
import 'package:quickr_user_flutter_app/domain/core/di/injection.dart';
import 'package:quickr_user_flutter_app/presentation/auth/login_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class LogoutConfirmationBottomSheet extends StatelessWidget {
  const LogoutConfirmationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Image.asset(AppAssets.logout, height: 60, width: 60),
            gap16,
            // Title
            Text('Are You Logging Out?', style: context.textStyle1.bold.s20),
            gap16,
            // Description
            Text(
              'Are you sure do you want\nto logout this app',
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
                    textStyle: context.textStyle1.s14.w300.red,
                    borderColor: ColorResources.red,
                    backgroundColor: ColorResources.white,
                  ),
                ),
                gap16,
                // Delete Button
                Expanded(
                  child: CommonButton(
                    text: 'Confirm',
                    onPressed: () async {
                      await sl<IAuthLocalFacade>().clearTokens();
                      AppRoute.pushNamedAndRemoveUntil(LoginScreen.routeName);
                    },
                    backgroundColor: ColorResources.red,
                    borderColor: ColorResources.transparent,
                    textStyle: context.textStyle1.s14.w300.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
