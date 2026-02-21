import 'dart:io';

import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/auth/models/otp_response.dart';
import 'package:quickr_user_flutter_app/domain/auth/models/verify_response.dart';

abstract interface class IAuthFacade {
  ResultFuture<OTPResponse> sendOtp({required String mobile});
  ResultFuture<VerifyResponse> verifyOtp({
    required String mobile,
    required String otp,
  });
  ResultFuture<String> register({
    required String firstName,
    required String lastName,
    required String email,
    int? age,
    String? gender,
    File? profileImage,
  });
}
