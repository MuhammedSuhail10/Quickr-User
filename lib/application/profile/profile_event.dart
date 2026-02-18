part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getProfileData() = GetProfileData;
  const factory ProfileEvent.updatePhoneRequest({
    required String phone,
    required int otp,
  }) = UpdatePhoneRequest;
  const factory ProfileEvent.updatePhoneVerify({
    required String phone,
    required int otp,
  }) = UpdatePhoneVerify;
  const factory ProfileEvent.updateEmailRequest({
    required String email,
    required int otp,
  }) = UpdateEmailRequest;
  const factory ProfileEvent.updateEmailVerify({
    required String email,
    required int otp,
  }) = UpdateEmailVerify;
  const factory ProfileEvent.deleteAccount() = DeleteAccount;
}
