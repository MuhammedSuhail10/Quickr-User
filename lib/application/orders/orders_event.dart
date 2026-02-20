part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.getOrders({
    @Default(0) int lastScheduledId,
    @Default(0) int lastOtherId,
  }) = GetOrders;
}
