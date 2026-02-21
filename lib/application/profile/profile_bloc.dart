import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/profile/i_profile_facade.dart';
import 'package:quickr_user_flutter_app/domain/profile/models/profile_response.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileFacade _profileFacade;

  ProfileBloc(this._profileFacade) : super(ProfileState.initial()) {
    on<GetProfileData>(_getProfileData);
    on<UpdatePhoneRequest>(_updatePhoneRequest);
    on<UpdatePhoneVerify>(_updatePhoneVerify);
    on<UpdateEmailRequest>(_updateEmailRequest);
    on<UpdateEmailVerify>(_updateEmailVerify);
    on<DeleteAccount>(_deleteAccount);
    on<ResetPhoneRequestStatus>(_resetPhoneRequestStatus);
    on<ResetPhoneVerifyStatus>(_resetPhoneVerifyStatus);
    on<ResetEmailRequestStatus>(_resetEmailRequestStatus);
    on<ResetEmailVerifyStatus>(_resetEmailVerifyStatus);
    on<UpdateProfile>(_updateProfile);
    on<ResetUpdateProfileStatus>(_resetUpdateProfileStatus);
  }

  Future<void> _getProfileData(
    GetProfileData event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        getProfileStatus: ApiStatus.loading,
        errorMessage: null,
        profileResponse: null,
      ),
    );

    final result = await _profileFacade.getprofileDetails();

    result.fold(
      (failure) => emit(
        state.copyWith(
          getProfileStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getProfileStatus: ApiStatus.success,
          profileResponse: response,
        ),
      ),
    );
  }

  Future<void> _updatePhoneRequest(
    UpdatePhoneRequest event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        updatePhoneRequestStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _profileFacade.updatePhoneRequest(phone: event.phone);

    result.fold(
      (failure) => emit(
        state.copyWith(
          updatePhoneRequestStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) =>
          emit(state.copyWith(updatePhoneRequestStatus: ApiStatus.success)),
    );
  }

  Future<void> _updatePhoneVerify(
    UpdatePhoneVerify event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        updatePhoneVerifyStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _profileFacade.updatePhoneVerify(
      phone: event.phone,
      otp: event.otp,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          updatePhoneVerifyStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) =>
          emit(state.copyWith(updatePhoneVerifyStatus: ApiStatus.success)),
    );
  }

  Future<void> _updateEmailRequest(
    UpdateEmailRequest event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        updateEmailRequestStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _profileFacade.updateEmailRequest(email: event.email);

    result.fold(
      (failure) => emit(
        state.copyWith(
          updateEmailRequestStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) =>
          emit(state.copyWith(updateEmailRequestStatus: ApiStatus.success)),
    );
  }

  Future<void> _updateEmailVerify(
    UpdateEmailVerify event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        updateEmailVerifyStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _profileFacade.updateEmailVerify(
      email: event.email,
      otp: event.otp,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          updateEmailVerifyStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) =>
          emit(state.copyWith(updateEmailVerifyStatus: ApiStatus.success)),
    );
  }

  Future<void> _deleteAccount(
    DeleteAccount event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        deleteAccountStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _profileFacade.deleteAccount();

    result.fold(
      (failure) => emit(
        state.copyWith(
          deleteAccountStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (success) => emit(state.copyWith(deleteAccountStatus: ApiStatus.success)),
    );
  }

  void _resetPhoneRequestStatus(
    ResetPhoneRequestStatus event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(updatePhoneRequestStatus: ApiStatus.initial));
  }

  void _resetPhoneVerifyStatus(
    ResetPhoneVerifyStatus event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(updatePhoneVerifyStatus: ApiStatus.initial));
  }

  void _resetEmailRequestStatus(
    ResetEmailRequestStatus event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(updateEmailRequestStatus: ApiStatus.initial));
  }

  void _resetEmailVerifyStatus(
    ResetEmailVerifyStatus event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(updateEmailVerifyStatus: ApiStatus.initial));
  }

  Future<void> _updateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        updateProfileStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _profileFacade.updateProfile(
      firstName: event.firstName,
      lastName: event.lastName,
      age: event.age,
      gender: event.gender,
      profileImage: event.profileImage,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          updateProfileStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (_) => emit(state.copyWith(updateProfileStatus: ApiStatus.success)),
    );
  }

  void _resetUpdateProfileStatus(
    ResetUpdateProfileStatus event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(updateProfileStatus: ApiStatus.initial));
  }
}
