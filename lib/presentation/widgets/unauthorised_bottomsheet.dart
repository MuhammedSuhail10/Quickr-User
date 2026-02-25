import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/auth/login_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class UnauthorisedBottomsheet extends StatelessWidget {
  const UnauthorisedBottomsheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const UnauthorisedBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(screenpadding),
      decoration: const BoxDecoration(
        color: ColorResources.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: ColorResources.lightGray,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          gap24,
          const Icon(
            Icons.lock_person_outlined,
            size: 80,
            color: ColorResources.primary,
          ),
          gap24,
          Text(
            'Unauthorized Access',
            style: context.heading.w600.s24.black,
            textAlign: TextAlign.center,
          ),
          gap12,
          Text(
            'Your session has expired or you are not logged in. Please login to continue to access this feature.',
            style: context.body.s16.slateGray,
            textAlign: TextAlign.center,
          ),
          gap32,
          CommonButton(
            text: 'Login Now',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (route) => false,
              );
            },
          ),
          gap12,
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Back', style: context.body.s16.primary.w600),
          ),
          gap12,
        ],
      ),
    );
  }
}
