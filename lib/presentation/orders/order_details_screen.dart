import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:quickr_user_flutter_app/application/core/utils/alert_dialog.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/orders/orders_bloc.dart';
import 'package:quickr_user_flutter_app/domain/orders/models/orders_response.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  static const routeName = 'order-details';

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  // Define the theme colors based on the image
  final Color primaryGreen = const Color(0xFF437661);
  final Color surfaceGrey = const Color(
    0xFFD9D9D9,
  ); // Changed to match image grey better
  final Color cancelRed = const Color(0xFFA91D1D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
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
              typeAlert: TypeAlert.error,
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetRescheduleStatus(),
            );
          }

          if (state.cancelStatus == ApiStatus.success) {
            CustomAlertDialog.showCustomDialog(
              title: 'Order cancelled successfully!',
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetCancelStatus(),
            );
            context.read<OrdersBloc>().add(const OrdersEvent.getOrders());
            Navigator.pop(context);
          } else if (state.cancelStatus == ApiStatus.error) {
            CustomAlertDialog.showCustomDialog(
              title: state.errorMessage ?? 'Failed to cancel order',
              typeAlert: TypeAlert.error,
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetCancelStatus(),
            );
          }

          if (state.verifyStatus == ApiStatus.success) {
            CustomAlertDialog.showCustomDialog(
              title: 'Order verified successfully!',
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetVerifyStatus(),
            );
            context.read<OrdersBloc>().add(const OrdersEvent.getOrders());
          } else if (state.verifyStatus == ApiStatus.error) {
            CustomAlertDialog.showCustomDialog(
              title: state.errorMessage ?? 'Verification failed',
              typeAlert: TypeAlert.error,
            );
            context.read<OrdersBloc>().add(
              const OrdersEvent.resetVerifyStatus(),
            );
          }
        },
        builder: (context, state) {
          final order = widget.order;
          const mediaBaseUrl = 'https://fixifybackend.pythonanywhere.com';
          return Column(
            children: [
              // Custom Top Section Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top:
                      MediaQuery.of(context).padding.top +
                      10, // Account for status bar
                  bottom: 30,
                  left: 16,
                  right: 16,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF437661), // The forest green color
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25), // Increased rounding
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button and Title
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          order.categoryName ?? "Order Details",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    // Phone Icon
                    const Icon(Icons.phone, color: Colors.white, size: 24),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Placeholder Image Card
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: order.workImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: '$mediaBaseUrl${order.workImage}',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "No Image",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 24),

                      // 2. User Info Section
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color(0xFF333333),
                            backgroundImage: order.worker?.profileImage != null
                                ? NetworkImage(order.worker!.profileImage!)
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${order.worker?.firstName ?? 'Not'} ${order.worker?.lastName ?? 'Assigned'}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order.address?.addressLine1 ?? "No Address",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '#${order.orderId ?? order.id}',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order.orderedOn ?? "",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            order.status ?? "Unknown",
                            style: TextStyle(
                              color: primaryGreen.withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // 3. Service Details Card
                      if (order.service != null && order.service!.isNotEmpty)
                        _buildInfoCard(
                          child: Column(
                            children: order.service!
                                .map(
                                  (s) => Column(
                                    children: [
                                      _rowItem(
                                        s.service?.name ?? "",
                                        "${s.rate ?? 0} (${s.quantity ?? 1})",
                                      ),
                                      if (order.service!.last != s)
                                        const SizedBox(height: 6),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),

                      // 4. Action Buttons (Verify/Reschedule)
                      _buildInfoCard(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () =>
                                        _handleVerifyCode(context, order.id!),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Verify Code",
                                          style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => _showRescheduleBottomSheet(
                                      context,
                                      order.id!,
                                    ),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: primaryGreen,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Reschedule",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ), // For the large grey area in the image
                          ],
                        ),
                      ),

                      // 5. Rates Section
                      _buildInfoCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Rates",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 12),
                            _rowItem(
                              "Service Charge",
                              "${order.serviceCharge ?? 0}",
                            ),
                            const SizedBox(height: 4),
                            _rowItem(
                              "Visitation Fees",
                              "${order.deliveryCharge ?? 0}",
                            ),
                            const SizedBox(height: 4),
                            _rowItem("GST", "${order.gstCharge ?? 0}"),
                          ],
                        ),
                      ),

                      // 6. Rating Section
                      _buildInfoCard(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_border,
                              color: Colors.black,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              order.rating != null && order.rating! > 0
                                  ? "Rating: ${order.rating}"
                                  : "No rating",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 7. Support Section
                      _buildInfoCard(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.headset_mic_outlined,
                              color: Colors.black,
                              size: 24,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Raise an issue",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 24,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 8. Cancel Button
                      if (order.isCancellable == true)
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () =>
                                _showCancelDialog(context, order.id!),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cancelRed,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Helper to build the grey background cards
  Widget _buildInfoCard({required Widget child, EdgeInsetsGeometry? padding}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceGrey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  // Helper for key-value rows
  Widget _rowItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
        ),
      ],
    );
  }

  void _handleVerifyCode(BuildContext context, int orderId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: primaryGreen,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<OrdersBloc>(),
        child: VerifyCodeBottomSheetOrders(orderId: orderId),
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
                  const Text(
                    'Reschedule Order',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
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
                      foregroundColor: Colors.black,
                      side: BorderSide(color: primaryGreen),
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
                      foregroundColor: Colors.black,
                      side: BorderSide(color: primaryGreen),
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
                        backgroundColor: primaryGreen,
                        foregroundColor: Colors.white,
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
    await showDialog(
      context: context,
      builder: (ctx) {
        return _CancelOrderDialog(orderId: orderId, parentContext: context);
      },
    );
  }
}

class _CancelOrderDialog extends StatefulWidget {
  final int orderId;
  final BuildContext parentContext;

  const _CancelOrderDialog({
    required this.orderId,
    required this.parentContext,
  });

  @override
  State<_CancelOrderDialog> createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends State<_CancelOrderDialog> {
  late final TextEditingController _reasonController;

  @override
  void initState() {
    super.initState();
    _reasonController = TextEditingController();
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color cancelRed = Color(0xFFA91D1D);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Cancel Order'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Please provide a reason for cancellation:'),
            const SizedBox(height: 12),
            TextField(
              controller: _reasonController,
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
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        ),
        ElevatedButton(
          onPressed: () {
            final reason = _reasonController.text.trim();
            if (reason.isEmpty) return;
            widget.parentContext.read<OrdersBloc>().add(
              OrdersEvent.cancelOrder(
                orderId: widget.orderId,
                cancellationReason: reason,
              ),
            );
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: cancelRed,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Cancel Order'),
        ),
      ],
    );
  }
}

class VerifyCodeBottomSheetOrders extends StatefulWidget {
  final int orderId;
  const VerifyCodeBottomSheetOrders({super.key, required this.orderId});

  @override
  State<VerifyCodeBottomSheetOrders> createState() =>
      _VerifyCodeBottomSheetOrdersState();
}

class _VerifyCodeBottomSheetOrdersState
    extends State<VerifyCodeBottomSheetOrders> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == 4) {
      FocusScope.of(context).unfocus();
      context.read<OrdersBloc>().add(
        OrdersEvent.verifyOrder(orderId: widget.orderId, otp: int.parse(otp)),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 32, 24, 32 + bottomPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Code',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Enter code provided by the employee',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => SizedBox(
                width: 64,
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => _onChanged(value, index),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'For security, ask code from the employee. Only after verifying should the worker be allowed to start working/ to enter the home.',
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
