import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';

abstract interface class IAuthLocalFacade {
  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  });
  String? getAccessToken();
  String? getRefreshToken();
  Future<void> clearTokens();
  ResultFuture<bool> isLoggedIn();
}
