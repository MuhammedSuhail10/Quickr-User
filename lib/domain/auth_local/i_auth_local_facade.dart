abstract interface class IAuthLocalFacade {
  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  });
  String? getAccessToken();
  String? getRefreshToken();
  Future<void> clearTokens();
}
