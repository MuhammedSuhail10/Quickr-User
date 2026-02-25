import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/home/models/all_categories_response.dart';
import 'package:quickr_user_flutter_app/domain/home/models/home_response.dart';
import 'package:quickr_user_flutter_app/domain/home/models/scheduled_order_response.dart';
import 'package:quickr_user_flutter_app/domain/home/models/services_response.dart';
import 'package:quickr_user_flutter_app/domain/home/models/worker_details_response.dart';

abstract interface class IHomeFacade {
  ResultFuture<HomeResponse> getHomeData();
  ResultFuture<AllCategoriesResponse> getAllCategories({
    int? lastId,
    String? searchQuery,
  });
  ResultFuture<ServiceResponse> getSubCategoryServices({
    required int categoryId,
  });
  ResultFuture<ScheduledOrderResponse> getScheduledOrders();
  ResultFuture<bool> verifyOrder({required int orderId, required int otp});
  ResultFuture<WorkerDetailsResponse> getWorkerDetails({required int orderId});
}
