import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/auth/i_auth_facade.dart';
import 'package:quickr_user_flutter_app/domain/auth/models/otp_response.dart';
import 'package:quickr_user_flutter_app/domain/auth/models/verify_response.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(AuthState.initial()) {
    on<SendOtp>(_sendOtp);
    on<VerifyOtp>(_verifyOtp);
    on<ResetSendOtp>(_resetSendOtp);
    on<ResetVerifyOtp>(_resetVerifyOtp);
    on<Register>(_register);
    on<ResetRegisterStatus>(_resetRegisterStatus);
  }
  Future<void> _sendOtp(SendOtp event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        sendOtpStatus: ApiStatus.loading,
        errorMessage: null,
        otpResponse: null,
      ),
    );

    final result = await _authFacade.sendOtp(mobile: event.mobile);

    result.fold(
      (failure) => emit(
        state.copyWith(
          sendOtpStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(sendOtpStatus: ApiStatus.success, otpResponse: response),
      ),
    );
  }

  Future<void> _verifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        verifyOtpStatus: ApiStatus.loading,
        errorMessage: null,
        verifyResponse: null,
      ),
    );

    final result = await _authFacade.verifyOtp(
      mobile: event.mobile,
      otp: event.otp,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          verifyOtpStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          verifyOtpStatus: ApiStatus.success,
          verifyResponse: response,
        ),
      ),
    );
  }

  void _resetSendOtp(ResetSendOtp event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        sendOtpStatus: ApiStatus.initial,
        otpResponse: null,
        errorMessage: null,
      ),
    );
  }

  void _resetVerifyOtp(ResetVerifyOtp event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        verifyOtpStatus: ApiStatus.initial,
        verifyResponse: null,
        errorMessage: null,
      ),
    );
  }

  Future<void> _register(Register event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(registrationStatus: ApiStatus.loading, errorMessage: null),
    );

    final result = await _authFacade.register(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      age: event.age,
      gender: event.gender,
      profileImage: event.profileImage,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          registrationStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (successMsg) => emit(
        state.copyWith(
          registrationStatus: ApiStatus.success,
          successMessage: successMsg,
        ),
      ),
    );
  }

  void _resetRegisterStatus(
    ResetRegisterStatus event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        registrationStatus: ApiStatus.initial,
        errorMessage: null,
        successMessage: null,
      ),
    );
  }
}
