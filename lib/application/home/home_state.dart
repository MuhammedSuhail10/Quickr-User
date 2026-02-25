part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ApiStatus getHomeStatus,
    HomeResponse? homeResponse,
    required ApiStatus getAllCategoriesStatus,
    AllCategoriesResponse? allCategoriesResponse,
    required ApiStatus getSubCategoryServicesStatus,
    ServiceResponse? serviceResponse,
    required ApiStatus getScheduledOrdersStatus,
    ScheduledOrderResponse? scheduledOrderResponse,
    required ApiStatus verifyOrderStatus,
    required ApiStatus getWorkerDetailsStatus,
    WorkerDetailsResponse? workerDetailsResponse,
    String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    getHomeStatus: ApiStatus.initial,
    homeResponse: null,
    getAllCategoriesStatus: ApiStatus.initial,
    allCategoriesResponse: null,
    getSubCategoryServicesStatus: ApiStatus.initial,
    serviceResponse: null,
    getScheduledOrdersStatus: ApiStatus.initial,
    scheduledOrderResponse: null,
    verifyOrderStatus: ApiStatus.initial,
    getWorkerDetailsStatus: ApiStatus.initial,
    workerDetailsResponse: null,
    errorMessage: null,
  );
}
