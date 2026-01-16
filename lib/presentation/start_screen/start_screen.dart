import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'dart:ui';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/home/main_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const routeName = 'start';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(AppAssets.startImage, fit: BoxFit.cover),

          // Content with Glass Effect
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: const Color(0xFF403A3A).withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                        border: const Border(
                          top: BorderSide(color: Color(0xFF847D7D), width: 0.5),
                          left: BorderSide(
                            color: Color(0xFF847D7D),
                            width: 0.5,
                          ),
                          right: BorderSide(
                            color: Color(0xFF847D7D),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gap12,
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                letterSpacing: 0.5,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Hire ',
                                  style: context.heading.w400.s24.white,
                                ),
                                TextSpan(
                                  text: 'professionals',
                                  style: context.heading.w400.s24.copyWith(
                                    color: const Color(0XFF69AE95),
                                  ),
                                ),
                                TextSpan(
                                  text: ' in a\nclick...',
                                  style: context.heading.w400.s24.white,
                                ),
                              ],
                            ),
                          ),
                          gap4,
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                letterSpacing: 0.5,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Get ',
                                  style: context.heading.w400.s24.white,
                                ),
                                TextSpan(
                                  text: 'services',
                                  style: context.heading.w400.s24.copyWith(
                                    color: const Color(0XFF69AE95),
                                  ),
                                ),
                                TextSpan(
                                  text: ' at your\ndoorstep...',
                                  style: context.heading.w400.s24.white,
                                ),
                              ],
                            ),
                          ),
                          gap48,
                          // Start Exploring Button
                          CommonButton(
                            text: 'Start Exploring',
                            onPressed: () {
                              AppRoute.pushNamedAndRemoveUntil(
                                MainScreen.routeName,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
