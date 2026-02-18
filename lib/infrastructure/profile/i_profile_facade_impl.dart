import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/service/dio_client.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/application/core/utils/urls.dart';
import 'package:quickr_user_flutter_app/domain/core/base/run_safely.dart';
import 'package:quickr_user_flutter_app/domain/profile/i_profile_facade.dart';
import 'package:quickr_user_flutter_app/domain/profile/models/profile_response.dart';

@LazySingleton(as: IProfileFacade)
class IProfileFacadeImpl implements IProfileFacade {
  final DioClient dioClient;
  final RunSafely runSafely;

  IProfileFacadeImpl({required this.dioClient, required this.runSafely});

  @override
  ResultFuture<ProfileResponse> getprofileDetails() {
    return runSafely.runSafely(() async {
      final response = await dioClient.get(Urls.getProfile);
      return ProfileResponse.fromJson(response.data as Map<String, dynamic>);
    });
  }

  @override
  ResultFuture<bool> updatePhoneRequest({
    required String phone,
    required int otp,
  }) {
    return runSafely.runSafely(() async {
      await dioClient.post(
        Urls.updatePhoneRequest,
        data: {"new_phone": phone, "otp": otp},
      );
      return true;
    });
  }

  @override
  ResultFuture<bool> updatePhoneVerify({
    required String phone,
    required int otp,
  }) {
    return runSafely.runSafely(() async {
      await dioClient.post(
        Urls.updatePhoneVerify,
        data: {"new_phone": phone, "otp": otp},
      );
      return true;
    });
  }

  @override
  ResultFuture<bool> updateEmailRequest({
    required String email,
    required int otp,
  }) {
    return runSafely.runSafely(() async {
      await dioClient.post(
        Urls.updateEmailRequest,
        data: {"new_email": email, "otp": otp},
      );
      return true;
    });
  }

  @override
  ResultFuture<bool> updateEmailVerify({
    required String email,
    required int otp,
  }) {
    return runSafely.runSafely(() async {
      await dioClient.post(
        Urls.updateEmailVerify,
        data: {"new_email": email, "otp": otp},
      );
      return true;
    });
  }

  @override
  ResultFuture<bool> deleteAccount() {
    return runSafely.runSafely(() async {
      await dioClient.post(Urls.deleteAccount);
      return true;
    });
  }
}
