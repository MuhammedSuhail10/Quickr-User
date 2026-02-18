part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    required ApiStatus getAddressStatus,
    required ApiStatus addAddressStatus,
    required ApiStatus updateAddressStatus,
    required ApiStatus deleteAddressStatus,
    AddressResponse? addressResponse,
    String? errorMessage,
  }) = _AddressState;

  factory AddressState.initial() => const AddressState(
    getAddressStatus: ApiStatus.initial,
    addAddressStatus: ApiStatus.initial,
    updateAddressStatus: ApiStatus.initial,
    deleteAddressStatus: ApiStatus.initial,
    addressResponse: null,
    errorMessage: null,
  );
}
