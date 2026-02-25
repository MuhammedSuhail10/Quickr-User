import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/home/main_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});
  static const routeName = 'booking-success';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(AppAssets.startImage, fit: BoxFit.cover),
            Container(color: ColorResources.black.withOpacity(0.3)),
            // Content
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Success Icon
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: ColorResources.secondaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 200,
                      color: ColorResources.primary,
                    ),
                  ),
                  gap32,
                  // Success Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Booked Successfully',
                        style: context.textStyle1.bold.s26.white,
                        textAlign: TextAlign.center,
                      ),
                      gap12,
                      Text(
                        'Sit back and Relax,',
                        style: context.textStyle1.w300.s14.white,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'While we find a worker for you',
                        style: context.textStyle1.w300.s14.white,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  gap60,
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: 'Orders',
                  textStyle: context.textStyle1.w600.s18.white,
                  borderRadius: BorderRadius.circular(16),
                  onPressed: () {
                    AppRoute.pushNamedAndRemoveUntil(
                      MainScreen.routeName,
                      arguments: {'initialIndex': 2},
                    );
                  },
                ),
              ),
              gap16,
              Expanded(
                child: CommonButton(
                  text: 'Home',
                  textStyle: context.textStyle1.w600.s18.black,
                  borderRadius: BorderRadius.circular(16),
                  onPressed: () {
                    AppRoute.pushNamedAndRemoveUntil(MainScreen.routeName);
                  },
                  backgroundColor: ColorResources.secondaryColor,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
