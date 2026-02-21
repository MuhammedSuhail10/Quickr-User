part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getProfileData() = GetProfileData;
  const factory ProfileEvent.updatePhoneRequest({required String phone}) =
      UpdatePhoneRequest;
  const factory ProfileEvent.updatePhoneVerify({
    required String phone,
    required int otp,
  }) = UpdatePhoneVerify;
  const factory ProfileEvent.updateEmailRequest({required String email}) =
      UpdateEmailRequest;
  const factory ProfileEvent.updateEmailVerify({
    required String email,
    required int otp,
  }) = UpdateEmailVerify;
  const factory ProfileEvent.deleteAccount() = DeleteAccount;
  const factory ProfileEvent.resetPhoneRequestStatus() =
      ResetPhoneRequestStatus;
  const factory ProfileEvent.resetPhoneVerifyStatus() = ResetPhoneVerifyStatus;
  const factory ProfileEvent.resetEmailRequestStatus() =
      ResetEmailRequestStatus;
  const factory ProfileEvent.resetEmailVerifyStatus() = ResetEmailVerifyStatus;
  const factory ProfileEvent.updateProfile({
    required String firstName,
    required String lastName,
    int? age,
    String? gender,
    File? profileImage,
  }) = UpdateProfile;
  const factory ProfileEvent.resetUpdateProfileStatus() =
      ResetUpdateProfileStatus;
}
