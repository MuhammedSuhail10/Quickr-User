import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/address/i_address_facade.dart';
import 'package:quickr_user_flutter_app/domain/address/models/address_response.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final IAddressFacade _addressFacade;

  AddressBloc(this._addressFacade) : super(AddressState.initial()) {
    on<GetAddress>(_getAddress);
    on<AddAddress>(_addAddress);
    on<UpdateAddress>(_updateAddress);
    on<DeleteAddress>(_deleteAddress);
  }

  Future<void> _getAddress(GetAddress event, Emitter<AddressState> emit) async {
    emit(
      state.copyWith(
        getAddressStatus: ApiStatus.loading,
        errorMessage: null,
        addressResponse: null,
      ),
    );

    final result = await _addressFacade.getAddress();

    result.fold(
      (failure) => emit(
        state.copyWith(
          getAddressStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getAddressStatus: ApiStatus.success,
          addressResponse: response,
        ),
      ),
    );
  }

  Future<void> _addAddress(AddAddress event, Emitter<AddressState> emit) async {
    emit(
      state.copyWith(addAddressStatus: ApiStatus.loading, errorMessage: null),
    );

    final result = await _addressFacade.addAddress(event.address);

    result.fold(
      (failure) => emit(
        state.copyWith(
          addAddressStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) => emit(state.copyWith(addAddressStatus: ApiStatus.success)),
    );
  }

  Future<void> _updateAddress(
    UpdateAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(
      state.copyWith(
        updateAddressStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _addressFacade.updateAddress(event.address);

    result.fold(
      (failure) => emit(
        state.copyWith(
          updateAddressStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) => emit(state.copyWith(updateAddressStatus: ApiStatus.success)),
    );
  }

  Future<void> _deleteAddress(
    DeleteAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(
      state.copyWith(
        deleteAddressStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _addressFacade.deleteAddress(event.addressId);

    result.fold(
      (failure) => emit(
        state.copyWith(
          deleteAddressStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) => emit(state.copyWith(deleteAddressStatus: ApiStatus.success)),
    );
  }
}
