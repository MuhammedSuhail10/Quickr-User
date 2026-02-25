part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    required ApiStatus getOrdersStatus,
    required ApiStatus rescheduleStatus,
    required ApiStatus cancelStatus,
    required ApiStatus verifyStatus,
    OrdersResponse? ordersResponse,
    String? errorMessage,
  }) = _OrdersState;

  factory OrdersState.initial() => const OrdersState(
    getOrdersStatus: ApiStatus.initial,
    rescheduleStatus: ApiStatus.initial,
    cancelStatus: ApiStatus.initial,
    verifyStatus: ApiStatus.initial,
    ordersResponse: null,
    errorMessage: null,
  );
}
