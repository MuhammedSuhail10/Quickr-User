import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/domain/auth_local/i_auth_local_facade.dart';
import 'package:quickr_user_flutter_app/domain/core/di/injection.dart';
import 'package:quickr_user_flutter_app/presentation/orders/order_details_screen.dart';
import 'package:quickr_user_flutter_app/presentation/orders/order_details_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/orders/orders_bloc.dart';
import 'package:quickr_user_flutter_app/domain/orders/models/orders_response.dart';

class OrderMainScreen extends StatefulWidget {
  const OrderMainScreen({super.key});

  static const routeName = 'orders';

  @override
  State<OrderMainScreen> createState() => _OrderMainScreenState();
}

class _OrderMainScreenState extends State<OrderMainScreen> {
  @override
  void initState() {
    super.initState();

    final authLocalFacade = sl<IAuthLocalFacade>();
    final token = authLocalFacade.getAccessToken();
    if (token != null) {
      context.read<OrdersBloc>().add(const OrdersEvent.getOrders());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white,
        elevation: 0,
        surfaceTintColor: ColorResources.transparent,
        leadingWidth: 40,
        title: Text('Orders', style: context.heading.w400.s24),
      ),
      body: BlocListener<OrdersBloc, OrdersState>(
        listener: (context, state) {
          // Handle reschedule status
          if (state.rescheduleStatus == ApiStatus.success) {
            CustomAlertDialog.showCustomDialog(
              title: 'Order rescheduled successfully!',
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetRescheduleStatus(),
            );
            context.read<OrdersBloc>().add(const OrdersEvent.getOrders());
          } else if (state.rescheduleStatus == ApiStatus.error) {
            CustomAlertDialog.showCustomDialog(
              title: state.errorMessage ?? 'Failed to reschedule order',
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetRescheduleStatus(),
            );
          }

          // Handle cancel status
          if (state.cancelStatus == ApiStatus.success) {
            CustomAlertDialog.showCustomDialog(
              title: 'Order cancelled successfully!',
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetCancelStatus(),
            );
            context.read<OrdersBloc>().add(const OrdersEvent.getOrders());
          } else if (state.cancelStatus == ApiStatus.error) {
            CustomAlertDialog.showCustomDialog(
              title: state.errorMessage ?? 'Failed to cancel order',
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetCancelStatus(),
            );
          }
        },
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state.getOrdersStatus == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.getOrdersStatus == ApiStatus.error) {
              return Center(child: Text(state.errorMessage ?? 'Error'));
            }

            final scheduledOrders = state.ordersResponse?.scheduledOrders ?? [];
            final otherOrders = state.ordersResponse?.otherOrders ?? [];

            return RefreshIndicator(
              color: ColorResources.secondary,
              onRefresh: () async {
                context.read<OrdersBloc>().add(const OrdersEvent.getOrders());
              },
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Scheduled Section
                  if (scheduledOrders.isNotEmpty) ...[
                    Text('Scheduled', style: context.textStyle1.w600.s16),
                    gap12,
                    ...scheduledOrders.map(
                      (order) => Column(
                        children: [_buildScheduledCard(context, order), gap24],
                      ),
                    ),
                  ],

                  // Completed Section
                  if (otherOrders.isNotEmpty) ...[
                    Text('Completed', style: context.textStyle1.w600.s16),
                    gap12,
                    _buildCompletedCards(context, otherOrders),
                  ],

                  if (scheduledOrders.isEmpty && otherOrders.isEmpty)
                    const Center(child: Text('No orders found')),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScheduledCard(BuildContext context, Order order) {
    return GestureDetector(
      onTap: () {
        AppRoute.pushNamed(
          OrderDetailsScreen.routeName,
          arguments: {'order': order},
        );
      },
      child: Container(
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
            Container(
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
                            gap4,
                            Row(
                              children: [
                                const Icon(
                                  Icons.work_outline,
                                  size: 16,
                                  color: ColorResources.white,
                                ),
                                gap6,
                                Text(
                                  '${order.worker?.totalExperiance ?? 0}yr',
                                  style: context.textStyle1.w300.s14.copyWith(
                                    color: ColorResources.white,
                                  ),
                                ),
                              ],
                            ),
                            gap4,
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 16,
                                  color: ColorResources.white,
                                ),
                                gap6,
                                Expanded(
                                  child: Text(
                                    order.address?.addressLine1 ?? '',
                                    style: context.textStyle1.w300.s14.copyWith(
                                      color: ColorResources.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                  Text(
                    'Visit Scheduled for: ${order.scheduledDate ?? ''}\n${order.scheduledTime ?? ''}',
                    textAlign: TextAlign.center,
                    style: context.textStyle1.w300.s12.white,
                  ),
                ],
              ),
            ),
            gap12,
            Row(
              children: [
                // OutlinedButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.phone, size: 18),
                //   label: const Text('Call'),
                //   style: OutlinedButton.styleFrom(
                //     foregroundColor: ColorResources.black,
                //     side: const BorderSide(color: ColorResources.black),
                //     padding: const EdgeInsets.all(12),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // ),
                const Spacer(),
                if (order.isCancellable == true) ...[
                  _buildIconButton(
                    AppAssets.edit,
                    () => _showRescheduleBottomSheet(context, order.id!),
                  ),
                  gap12,
                  _buildIconButton(
                    AppAssets.delete,
                    () => _showCancelDialog(context, order.id!),
                    isDelete: true,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedCards(BuildContext context, List<Order> orders) {
    return Column(
      children: orders.asMap().entries.map((entry) {
        final index = entry.key;
        final order = entry.value;
        return Column(
          children: [
            _buildCompletedCardItem(context, order),
            if (index < orders.length - 1) gap12,
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCompletedCardItem(BuildContext context, Order order) {
    final showRateButton =
        order.status?.toLowerCase() == 'completed' &&
        (order.rating == null || order.rating == 0);

    return GestureDetector(
      onTap: () => AppRoute.pushNamed(
        OrderDetailsScreen.routeName,
        arguments: {'order': order},
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.secondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.categoryName ?? '',
                    style: context.textStyle1.w300.s16,
                  ),
                  gap4,
                  Text(
                    order.orderedOn?.toOrderDateFormat() ?? '',
                    style: context.textStyle1.w300.s12,
                  ),
                  gap12,
                  Row(
                    children: [
                      if (showRateButton) ...[
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.star_outline, size: 18),
                          label: const Text('Rate'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: ColorResources.black,
                            side: const BorderSide(color: ColorResources.black),
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        gap8,
                      ],
                      if (order.isCancellable == true)
                        OutlinedButton.icon(
                          onPressed: () =>
                              _showRescheduleBottomSheet(context, order.id!),
                          icon: const Icon(Icons.refresh, size: 18),
                          label: const Text('Reschedule'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: ColorResources.black,
                            side: const BorderSide(color: ColorResources.black),
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            gap12,
            Container(
              decoration: BoxDecoration(
                color: ColorResources.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorResources.white,
                    backgroundImage: order.worker?.profileImage != null
                        ? NetworkImage(order.worker!.profileImage!)
                        : null,
                  ),
                  gap8,
                  Text(
                    '${order.worker?.firstName ?? 'Not'}\n${order.worker?.lastName ?? 'Available'}',
                    textAlign: TextAlign.center,
                    style: context.textStyle1.w300.s14.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
    String imgPath,
    VoidCallback onPressed, {
    bool isDelete = false,
  }) {
    return Container(
      height: 43,
      width: 43,
      decoration: BoxDecoration(
        color: isDelete ? ColorResources.red : ColorResources.transparent,
        border: isDelete ? null : Border.all(color: ColorResources.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(imgPath, height: 18, width: 18),
      ),
    );
  }

  Future<void> _showRescheduleBottomSheet(
    BuildContext context,
    int orderId,
  ) async {
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                MediaQuery.of(ctx).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Reschedule Order', style: context.textStyle1.w600.s18),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: ctx,
                        initialDate: DateTime.now().add(
                          const Duration(days: 1),
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        setModalState(() => selectedDate = date);
                      }
                    },
                    icon: const Icon(Icons.calendar_today, size: 18),
                    label: Text(
                      selectedDate == null
                          ? 'Select Date'
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      foregroundColor: ColorResources.black,
                      side: const BorderSide(color: ColorResources.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final time = await showTimePicker(
                        context: ctx,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setModalState(() => selectedTime = time);
                      }
                    },
                    icon: const Icon(Icons.access_time, size: 18),
                    label: Text(
                      selectedTime == null
                          ? 'Select Time'
                          : selectedTime!.format(ctx),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      foregroundColor: ColorResources.black,
                      side: const BorderSide(color: ColorResources.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedDate == null || selectedTime == null) {
                          CustomAlertDialog.showCustomDialog(
                            title: 'Please select date and time',
                            typeAlert: TypeAlert.warning,
                          );
                          return;
                        }
                        final dateStr =
                            '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}';
                        final timeStr =
                            '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}';
                        context.read<OrdersBloc>().add(
                          OrdersEvent.rescheduleOrder(
                            orderId: orderId,
                            scheduledDate: dateStr,
                            scheduledTime: timeStr,
                          ),
                        );
                        Navigator.pop(ctx);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.secondary,
                        foregroundColor: ColorResources.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Confirm Reschedule'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showCancelDialog(BuildContext context, int orderId) async {
    final reasonController = TextEditingController();
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Cancel Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Please provide a reason for cancellation:'),
              const SizedBox(height: 12),
              TextField(
                controller: reasonController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter reason...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: () {
                final reason = reasonController.text.trim();
                if (reason.isEmpty) {
                  CustomAlertDialog.showCustomDialog(
                    title: 'Please enter a cancellation reason',
                    typeAlert: TypeAlert.warning,
                  );
                  return;
                }
                context.read<OrdersBloc>().add(
                  OrdersEvent.cancelOrder(
                    orderId: orderId,
                    cancellationReason: reason,
                  ),
                );
                Navigator.pop(ctx);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorResources.red,
                foregroundColor: ColorResources.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Cancel Order'),
            ),
          ],
        );
      },
    );
    reasonController.dispose();
  }
}
