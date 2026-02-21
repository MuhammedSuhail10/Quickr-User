part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.sendOtp({required String mobile}) = SendOtp;

  const factory AuthEvent.verifyOtp({
    required String mobile,
    required String otp,
  }) = VerifyOtp;

  const factory AuthEvent.resetSendOtp() = ResetSendOtp;
  const factory AuthEvent.resetVerifyOtp() = ResetVerifyOtp;

  const factory AuthEvent.register({
    required String firstName,
    required String lastName,
    required String email,
    int? age,
    String? gender,
    File? profileImage,
  }) = Register;

  const factory AuthEvent.resetRegisterStatus() = ResetRegisterStatus;
}
