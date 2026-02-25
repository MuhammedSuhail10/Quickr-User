import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/domain/home/models/scheduled_order_response.dart';
import 'package:quickr_user_flutter_app/presentation/home/widgets/verify_code_bottom_sheet.dart';
import 'package:quickr_user_flutter_app/presentation/home/worker_details_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class ScheduledVisitCard extends StatelessWidget {
  final Order order;
  const ScheduledVisitCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.secondaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.categoryName ?? '',
                style: context.textStyle1.w300.s16,
              ),
              Text(
                order.orderedOn?.toOrderDateFormat() ?? '',
                style: context.textStyle1.w300.s12,
              ),
            ],
          ),
          gap12,
          GestureDetector(
            onTap: () {
              AppRoute.pushNamed(
                WorkerDetailsScreen.routeName,
                arguments: {'orderId': order.id},
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorResources.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${order.worker?.firstName ?? 'Not'} ${order.worker?.lastName ?? 'Assigned'}',
                              style: context.textStyle1.w300.s16.copyWith(
                                color: ColorResources.white,
                              ),
                            ),
                            gap12,
                            Row(
                              children: [
                                const Icon(
                                  Icons.wallet,
                                  size: 16,
                                  color: ColorResources.white,
                                ),
                                gap6,
                                Text(
                                  '${order.totalAmount ?? 0}',
                                  style: context.textStyle1.w300.s14.copyWith(
                                    color: ColorResources.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      gap12,
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorResources.white,
                        backgroundImage: order.worker?.profileImage != null
                            ? NetworkImage(order.worker!.profileImage!)
                            : null,
                      ),
                    ],
                  ),
                  gap12,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Visit Scheduled for: ${order.scheduledDate ?? ''} ${order.scheduledTime ?? ''}',
                      style: context.textStyle1.w300.s12.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          gap12,
          SizedBox(
            width: 140,
            height: 58,
            child: CommonButton(
              text: 'Verify Code',
              onPressed: () =>
                  showVerifyCodeBottomSheet(context, orderId: order.id!),
              backgroundColor: ColorResources.secondary,
              borderColor: ColorResources.transparent,
              textStyle: context.textStyle1.s14.w300.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
