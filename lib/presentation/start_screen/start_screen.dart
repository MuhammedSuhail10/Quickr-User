import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'dart:ui';

import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/presentation/home/main_screen.dart';

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
          Image.asset(
            AppAssets.startImage,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: Colors.grey[800]);
            },
          ),

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
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                letterSpacing: 0.5,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Hire ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'professionals',
                                  style: TextStyle(color: Color(0XFF69AE95)),
                                ),
                                TextSpan(
                                  text: ' in a\nclick...',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                letterSpacing: 0.5,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Get ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'services',
                                  style: TextStyle(color: Color(0XFF69AE95)),
                                ),
                                TextSpan(
                                  text: ' at your\ndoorstep...',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          gap48,

                          // Start Exploring Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                AppRoute.pushNamedAndRemoveUntil(
                                  MainScreen.routeName,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3A725E),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0,
                              ),
                              child:  Text(
                                'Start Exploring',
                                style: context.heading.w400.s26.white
                              ),
                            ),
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
