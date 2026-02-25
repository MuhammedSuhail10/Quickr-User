import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/orders/models/orders_response.dart';

abstract interface class IOrdersFacade {
  ResultFuture<OrdersResponse> getOrders({
    int? lastScheduledId,
    int? lastOtherId,
  });
  ResultFuture<bool> rescheduleorder({
    required int orderId,
    required String scheduledDate,
    required String scheduledTime,
  });
  ResultFuture<bool> cancelOrder({
    required int orderId,
    required String cancellationReason,
  });
  ResultFuture<bool> verifyOrder({required int orderId, required int otp});
}
