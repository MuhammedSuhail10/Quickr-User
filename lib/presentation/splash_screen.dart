import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/domain/auth_local/i_auth_local_facade.dart';
import 'package:quickr_user_flutter_app/domain/core/di/injection.dart';
import 'package:quickr_user_flutter_app/presentation/auth/login_screen.dart';
import 'package:quickr_user_flutter_app/presentation/home/main_screen.dart';
import 'package:quickr_user_flutter_app/presentation/start_screen/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final authLocalFacade = sl<IAuthLocalFacade>();

    final result = await authLocalFacade.isLoggedIn();

    if (!mounted) return;

    result.fold(
      (failure) => AppRoute.pushNamedAndRemoveUntil(StartScreen.routeName),
      (isLoggedIn) {
        if (isLoggedIn) {
          AppRoute.pushNamedAndRemoveUntil(MainScreen.routeName);
        } else {
          AppRoute.pushNamedAndRemoveUntil(StartScreen.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.primary,
      body: Center(child: Image.asset(AppAssets.logo)),
    );
  }
}
