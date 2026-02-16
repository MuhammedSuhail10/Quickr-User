part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required ApiStatus sendOtpStatus,
    required ApiStatus verifyOtpStatus,
    OTPResponse? otpResponse,
    VerifyResponse? verifyResponse,
    String? errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
    sendOtpStatus: ApiStatus.initial,
    verifyOtpStatus: ApiStatus.initial,
    otpResponse: null,
    verifyResponse: null,
    errorMessage: null,
  );
}
