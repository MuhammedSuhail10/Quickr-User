part of 'booking_bloc.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    required ApiStatus createOrderStatus,
    String? errorMessage,
  }) = _BookingState;

  factory BookingState.initial() => const BookingState(
    createOrderStatus: ApiStatus.initial,
    errorMessage: null,
  );
}
