import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Categories Grid Shimmer
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                );
              },
            ),
            gap24,
            // Banner Shimmer
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: ColorResources.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            gap24,
            // Top Services Title Shimmer
            Container(
              width: 150,
              height: 24,
              decoration: BoxDecoration(
                color: ColorResources.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            gap16,
            // Top Services Cards Shimmer
            SizedBox(
              height: 230,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => gap12,
                itemBuilder: (context, index) {
                  return Container(
                    width: (MediaQuery.of(context).size.width - 44) / 2,
                    decoration: BoxDecoration(
                      color: ColorResources.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  );
                },
              ),
            ),
            gap24,
            // Promotional Text Shimmer
            Container(
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                color: ColorResources.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            gap8,
            Container(
              width: 250,
              height: 30,
              decoration: BoxDecoration(
                color: ColorResources.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
