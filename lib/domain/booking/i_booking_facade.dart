import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/booking/models/booking_request.dart';

abstract interface class IBookingFacade {
  ResultFuture<bool> createOrder({required BookingRequest request});
}
