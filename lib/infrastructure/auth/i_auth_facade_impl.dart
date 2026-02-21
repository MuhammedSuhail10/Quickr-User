import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/service/dio_client.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/application/core/utils/urls.dart';
import 'package:quickr_user_flutter_app/domain/auth/i_auth_facade.dart';
import 'package:quickr_user_flutter_app/domain/auth/models/otp_response.dart';
import 'package:quickr_user_flutter_app/domain/auth/models/verify_response.dart';
import 'package:quickr_user_flutter_app/domain/core/base/run_safely.dart';

@LazySingleton(as: IAuthFacade)
class IAuthFacadeImpl implements IAuthFacade {
  final DioClient dioClient;
  final RunSafely runSafely;

  IAuthFacadeImpl({required this.dioClient, required this.runSafely});

  @override
  ResultFuture<OTPResponse> sendOtp({required String mobile}) {
    return runSafely.runSafely(() async {
      final response = await dioClient.post(
        Urls.sendOtp,
        data: {'phone': mobile},
      );
      return OTPResponse.fromJson(response.data as Map<String, dynamic>);
    });
  }

  @override
  ResultFuture<VerifyResponse> verifyOtp({
    required String mobile,
    required String otp,
  }) {
    return runSafely.runSafely(() async {
      final response = await dioClient.post(
        Urls.verifyOtp,
        data: {'phone': mobile, 'otp': otp},
      );
      return VerifyResponse.fromJson(response.data as Map<String, dynamic>);
    });
  }

  @override
  ResultFuture<String> register({
    required String firstName,
    required String lastName,
    required String email,
    int? age,
    String? gender,
    File? profileImage,
  }) {
    return runSafely.runSafely(() async {
      final formData = FormData.fromMap({
        if (profileImage != null)
          'profile_image': await MultipartFile.fromFile(profileImage.path),
        'data': jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          if (age != null) 'age': age,
          if (gender != null) 'gender': gender,
        }),
      });

      final response = await dioClient.post(Urls.register, data: formData);
      return response.data['message'] ?? 'Registration successful';
    });
  }
}
