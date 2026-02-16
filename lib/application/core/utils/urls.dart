import 'package:quickr_user_flutter_app/domain/core/di/env.dart';

class Urls {
  static String baseURL = Env.instance.domainUrl;
  static String apiVersionUrl = '$baseURL/api/user/v1/';

  // static var apiUrl = '${Env.instance.domainUrl}/api/';

  static const String tokenRefresh = 'token-refresh';

  static const String sendOtp = 'user/send-login-otp';
  static const String verifyOtp = 'user/login';
}
