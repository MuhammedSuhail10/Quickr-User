part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required ApiStatus getProfileStatus,
    required ApiStatus updatePhoneRequestStatus,
    required ApiStatus updatePhoneVerifyStatus,
    required ApiStatus updateEmailRequestStatus,
    required ApiStatus updateEmailVerifyStatus,
    required ApiStatus deleteAccountStatus,
    ProfileResponse? profileResponse,
    String? errorMessage,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState(
    getProfileStatus: ApiStatus.initial,
    updatePhoneRequestStatus: ApiStatus.initial,
    updatePhoneVerifyStatus: ApiStatus.initial,
    updateEmailRequestStatus: ApiStatus.initial,
    updateEmailVerifyStatus: ApiStatus.initial,
    deleteAccountStatus: ApiStatus.initial,
    profileResponse: null,
    errorMessage: null,
  );
}
