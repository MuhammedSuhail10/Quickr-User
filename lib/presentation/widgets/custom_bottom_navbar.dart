import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600; // Tablet breakpoint

    // Responsive sizing
    final containerHeight = isTablet ? 80.0 : 70.0;
    final iconSize = isTablet ? 30.0 : 28.0;
    final fontSize = isTablet ? 16.0 : 14.0;
    final verticalPadding = isTablet ? 6.0 : 4.0;
    final iconTextGap = isTablet ? 3.0 : 4.0;

    final items = [
      {
        'icon': AppAssets.home,
        'activeIcon': AppAssets.homeActive,
        'label': 'Home',
      },
      {
        'icon': AppAssets.service,
        'activeIcon': AppAssets.serviceActive,
        'label': 'Menu',
      },
      {
        'icon': AppAssets.cart,
        'activeIcon': AppAssets.cartActive,
        'label': 'Reports',
      },
      {
        'icon': AppAssets.profile,
        'activeIcon': AppAssets.profileActive,
        'label': 'Profile',
      },
    ];

    return Container(
      height: containerHeight,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 24 : 16,
        vertical: isTablet ? 8 : 0,
      ),
      decoration: BoxDecoration(
        color: ColorResources.secondary,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
        border: Border.all(color: ColorResources.secondary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => onItemSelected(index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                  horizontal: 4.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset(
                        isSelected ? item['activeIcon']! : item['icon']!,
                        height: iconSize,
                        width: iconSize,
                        fit: BoxFit.contain,
                    ),
                    ),
                    // SizedBox(height: iconTextGap),
                    // Flexible(
                    //   child: Text(
                    //     item['label']!,
                    //     style: isSelected
                    //         ? context.primaryText.copyWith(
                    //             fontSize: fontSize,
                    //             fontWeight: FontWeight.w400,
                    //             color: ColorResources.secondary,
                    //           )
                    //         : context.heading.copyWith(
                    //             fontSize: fontSize,
                    //             fontWeight: FontWeight.w400,
                    //             color: const Color(0XFFBAC3D0),
                    //           ),
                    //     textAlign: TextAlign.center,
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
