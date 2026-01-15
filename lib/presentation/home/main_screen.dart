import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/home/home_bloc.dart';
import 'package:quickr_user_flutter_app/presentation/home/home_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/custom_bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = 'main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;
  DateTime? _lastBackPressTime;

  void onItemTapped(int index) {
    scaffoldKey.currentState!.closeDrawer();
    setState(() {
      selectedIndex = index;
    });
  }

  bool _handleBackPress() {
    final now = DateTime.now();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;

      // Show an improved professional snackbar with logo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo, width: 16, height: 16),
              const SizedBox(width: 12),
              const Text(
                'Press back again to exit Quickr-User',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: ColorResources.black,
          duration: const Duration(seconds: 2),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.06,
            left: screenWidth * 0.099, // 7.5% margin on each side (15% total)
            right: screenWidth * 0.099,
          ),
          elevation: 4,
        ),
      );

      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) return;

            // If not on home screen (index 0), navigate to home screen
            if (selectedIndex == 1 ||
                selectedIndex == 2 ||
                selectedIndex == 3) {
              setState(() {
                selectedIndex = 0;
              });
              return;
            }

            // If on home screen (index 0), handle app exit
            final shouldPop = _handleBackPress();
            if (shouldPop) {
              SystemNavigator.pop();
            }
          },
          child: Scaffold(
            key: scaffoldKey,
            body: IndexedStack(index: selectedIndex, children: _pages),
            bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: selectedIndex,
              onItemSelected: onItemTapped,
            ),
          ),
        );
      },
    );
  }
}
