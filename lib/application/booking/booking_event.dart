part of 'booking_bloc.dart';

@freezed
class BookingEvent with _$BookingEvent {
  const factory BookingEvent.started() = _Started;
  const factory BookingEvent.createOrder({required BookingRequest request}) =
      CreateOrder;
}
