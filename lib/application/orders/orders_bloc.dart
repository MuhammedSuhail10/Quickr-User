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
    on<RescheduleOrder>(_rescheduleOrder);
    on<CancelOrder>(_cancelOrder);
    on<VerifyOrder>(_verifyOrder);
    on<ResetRescheduleStatus>(_resetRescheduleStatus);
    on<ResetCancelStatus>(_resetCancelStatus);
    on<ResetVerifyStatus>(_resetVerifyStatus);
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

  Future<void> _rescheduleOrder(
    RescheduleOrder event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(rescheduleStatus: ApiStatus.loading));

    final result = await _ordersFacade.rescheduleorder(
      orderId: event.orderId,
      scheduledDate: event.scheduledDate,
      scheduledTime: event.scheduledTime,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          rescheduleStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (_) => emit(state.copyWith(rescheduleStatus: ApiStatus.success)),
    );
  }

  Future<void> _cancelOrder(
    CancelOrder event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(cancelStatus: ApiStatus.loading));

    final result = await _ordersFacade.cancelOrder(
      orderId: event.orderId,
      cancellationReason: event.cancellationReason,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          cancelStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (_) => emit(state.copyWith(cancelStatus: ApiStatus.success)),
    );
  }

  void _resetRescheduleStatus(
    ResetRescheduleStatus event,
    Emitter<OrdersState> emit,
  ) {
    emit(
      state.copyWith(rescheduleStatus: ApiStatus.initial, errorMessage: null),
    );
  }

  void _resetCancelStatus(ResetCancelStatus event, Emitter<OrdersState> emit) {
    emit(state.copyWith(cancelStatus: ApiStatus.initial, errorMessage: null));
  }

  Future<void> _verifyOrder(
    VerifyOrder event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(verifyStatus: ApiStatus.loading));

    final result = await _ordersFacade.verifyOrder(
      orderId: event.orderId,
      otp: event.otp,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          verifyStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (_) => emit(state.copyWith(verifyStatus: ApiStatus.success)),
    );
  }

  void _resetVerifyStatus(ResetVerifyStatus event, Emitter<OrdersState> emit) {
    emit(state.copyWith(verifyStatus: ApiStatus.initial, errorMessage: null));
  }
}
