import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/address/models/address_response.dart';

abstract interface class IAddressFacade {
  ResultFuture<AddressResponse> getAddress();
  ResultFuture<bool> addAddress(Address address);
  ResultFuture<bool> updateAddress(Address address);
  ResultFuture<bool> deleteAddress(int addressId);
}
