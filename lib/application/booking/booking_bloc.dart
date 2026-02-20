import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/booking/i_booking_facade.dart';
import 'package:quickr_user_flutter_app/domain/booking/models/booking_request.dart';

part 'booking_event.dart';
part 'booking_state.dart';
part 'booking_bloc.freezed.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final IBookingFacade _bookingFacade;

  BookingBloc(this._bookingFacade) : super(BookingState.initial()) {
    on<CreateOrder>(_createOrder);
  }

  Future<void> _createOrder(
    CreateOrder event,
    Emitter<BookingState> emit,
  ) async {
    emit(
      state.copyWith(createOrderStatus: ApiStatus.loading, errorMessage: null),
    );

    final result = await _bookingFacade.createOrder(request: event.request);

    result.fold(
      (failure) => emit(
        state.copyWith(
          createOrderStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) => emit(state.copyWith(createOrderStatus: ApiStatus.success)),
    );
  }
}
