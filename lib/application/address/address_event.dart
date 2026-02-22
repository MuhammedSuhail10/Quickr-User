part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.getAddress() = GetAddress;
  const factory AddressEvent.addAddress(Address address) = AddAddress;
  const factory AddressEvent.updateAddress(Address address) = UpdateAddress;
  const factory AddressEvent.deleteAddress(int addressId) = DeleteAddress;
  const factory AddressEvent.resetAddAddressStatus() = ResetAddAddressStatus;
  const factory AddressEvent.resetUpdateAddressStatus() =
      ResetUpdateAddressStatus;
  const factory AddressEvent.resetDeleteAddressStatus() =
      ResetDeleteAddressStatus;
}
