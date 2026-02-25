part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getHomeData() = GetHomeData;
  const factory HomeEvent.getAllCategories({
    required int lastId,
    String? searchQuery,
  }) = GetAllCategories;
  const factory HomeEvent.getSubCategoryServices({required int categoryId}) =
      GetSubCategoryServices;
  const factory HomeEvent.getScheduledOrders() = GetScheduledOrders;
  const factory HomeEvent.verifyOrder({
    required int orderId,
    required int otp,
  }) = VerifyOrder;
  const factory HomeEvent.getWorkerDetails({required int orderId}) =
      GetWorkerDetails;
  const factory HomeEvent.resetVerifyOrderStatus() = ResetVerifyOrderStatus;
}
