import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/auth_local/i_auth_local_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IAuthLocalFacade)
class IAuthLocalFacadeImpl implements IAuthLocalFacade {
  final SharedPreferences _prefs;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  IAuthLocalFacadeImpl(this._prefs);

  @override
  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _prefs.setString(_accessTokenKey, accessToken);
    await _prefs.setString(_refreshTokenKey, refreshToken);
  }

  @override
  String? getAccessToken() {
    return _prefs.getString(_accessTokenKey);
  }

  @override
  String? getRefreshToken() {
    return _prefs.getString(_refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
    log("Token cleared");
  }

  @override
  ResultFuture<bool> isLoggedIn() async {
    final token = _prefs.getString(_accessTokenKey);
    return right(token != null && token.isNotEmpty);
  }
}
