part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required ApiStatus sendOtpStatus,
    required ApiStatus verifyOtpStatus,
    required ApiStatus registrationStatus,
    OTPResponse? otpResponse,
    VerifyResponse? verifyResponse,
    String? successMessage,
    String? errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
    sendOtpStatus: ApiStatus.initial,
    verifyOtpStatus: ApiStatus.initial,
    registrationStatus: ApiStatus.initial,
    otpResponse: null,
    verifyResponse: null,
    successMessage: null,
    errorMessage: null,
  );
}
