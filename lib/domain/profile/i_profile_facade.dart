import 'dart:io';

import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/profile/models/profile_response.dart';

abstract interface class IProfileFacade {
  ResultFuture<ProfileResponse> getprofileDetails();
  ResultFuture<bool> updateProfile({
    required String firstName,
    required String lastName,
    int? age,
    String? gender,
    File? profileImage,
  });
  ResultFuture<bool> updatePhoneRequest({required String phone});
  ResultFuture<bool> updatePhoneVerify({
    required String phone,
    required int otp,
  });
  ResultFuture<bool> updateEmailRequest({required String email});
  ResultFuture<bool> updateEmailVerify({
    required String email,
    required int otp,
  });
  ResultFuture<bool> deleteAccount();
}
