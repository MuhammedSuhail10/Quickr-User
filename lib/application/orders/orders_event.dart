part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.getOrders({
    int? lastScheduledId,
    int? lastOtherId,
  }) = GetOrders;

  const factory OrdersEvent.rescheduleOrder({
    required int orderId,
    required String scheduledDate,
    required String scheduledTime,
  }) = RescheduleOrder;

  const factory OrdersEvent.cancelOrder({
    required int orderId,
    required String cancellationReason,
  }) = CancelOrder;

  const factory OrdersEvent.verifyOrder({
    required int orderId,
    required int otp,
  }) = VerifyOrder;

  const factory OrdersEvent.resetRescheduleStatus() = ResetRescheduleStatus;
  const factory OrdersEvent.resetCancelStatus() = ResetCancelStatus;
  const factory OrdersEvent.resetVerifyStatus() = ResetVerifyStatus;
}
