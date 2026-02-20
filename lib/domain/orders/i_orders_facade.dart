import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/orders/models/orders_response.dart';

abstract interface class IOrdersFacade {
  ResultFuture<OrdersResponse> getOrders({
    int lastScheduledId = 0,
    int lastOtherId = 0,
  });
}
