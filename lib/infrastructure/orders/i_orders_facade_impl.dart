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
}
