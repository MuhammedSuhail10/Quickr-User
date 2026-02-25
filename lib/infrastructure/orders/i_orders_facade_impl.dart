import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/service/dio_client.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/application/core/utils/urls.dart';
import 'package:quickr_user_flutter_app/domain/orders/i_orders_facade.dart';
import 'package:quickr_user_flutter_app/domain/core/base/run_safely.dart';
import 'package:quickr_user_flutter_app/domain/orders/models/orders_response.dart';

@LazySingleton(as: IOrdersFacade)
class IOrdersFacadeImpl implements IOrdersFacade {
  final DioClient dioClient;
  final RunSafely runSafely;

  IOrdersFacadeImpl({required this.dioClient, required this.runSafely});

  @override
  ResultFuture<OrdersResponse> getOrders({
    int? lastScheduledId,
    int? lastOtherId,
  }) {
    return runSafely.runSafely(() async {
      final response = await dioClient.get(
        Urls.orders,
        queryParameters: {
          if (lastScheduledId != null) 'last_scheduled_id': lastScheduledId,
          if (lastOtherId != null) 'last_other_id': lastOtherId,
        },
      );
      return OrdersResponse.fromJson(response.data as Map<String, dynamic>);
    });
  }

  @override
  ResultFuture<bool> cancelOrder({
    required int orderId,
    required String cancellationReason,
  }) {
    return runSafely.runSafely(() async {
      await dioClient.patch(
        Urls.cancelOrder,
        queryParameters: {
          "order_id": orderId,
          "cancellation_reason": cancellationReason,
        },
      );
      return true;
    });
  }

  @override
  ResultFuture<bool> rescheduleorder({
    required int orderId,
    required String scheduledDate,
    required String scheduledTime,
  }) {
    return runSafely.runSafely(() async {
      await dioClient.patch(
        Urls.rescheduleOrder,
        data: {
          "order_id": orderId,
          "scheduled_date": scheduledDate,
          "scheduled_time": scheduledTime,
        },
      );
      return true;
    });
  }

  @override
  ResultFuture<bool> verifyOrder({required int orderId, required int otp}) {
    return runSafely.runSafely(() async {
      await dioClient.post(
        Urls.verifyOrder,
        data: {"order_id": orderId, "code": otp},
      );
      return true;
    });
  }
}
