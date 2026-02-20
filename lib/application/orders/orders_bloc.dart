import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/orders/i_orders_facade.dart';
import 'package:quickr_user_flutter_app/domain/orders/models/orders_response.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final IOrdersFacade _ordersFacade;

  OrdersBloc(this._ordersFacade) : super(OrdersState.initial()) {
    on<GetOrders>(_getOrders);
  }

  Future<void> _getOrders(GetOrders event, Emitter<OrdersState> emit) async {
    emit(
      state.copyWith(
        getOrdersStatus: ApiStatus.loading,
        errorMessage: null,
        ordersResponse: null,
      ),
    );

    final result = await _ordersFacade.getOrders(
      lastScheduledId: event.lastScheduledId,
      lastOtherId: event.lastOtherId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          getOrdersStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getOrdersStatus: ApiStatus.success,
          ordersResponse: response,
        ),
      ),
    );
  }
}
