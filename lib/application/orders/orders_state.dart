part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    required ApiStatus getOrdersStatus,
    OrdersResponse? ordersResponse,
    String? errorMessage,
  }) = _OrdersState;

  factory OrdersState.initial() => const OrdersState(
    getOrdersStatus: ApiStatus.initial,
    ordersResponse: null,
    errorMessage: null,
  );
}
