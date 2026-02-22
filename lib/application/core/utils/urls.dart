import 'package:quickr_user_flutter_app/domain/core/di/env.dart';

class Urls {
  static String baseURL = Env.instance.domainUrl;
  static String apiVersionUrl = '$baseURL/api/user/v1/';

  // static var apiUrl = '${Env.instance.domainUrl}/api/';

  static const String tokenRefresh = 'token-refresh';

  static const String sendOtp = 'user/send-login-otp';
  static const String verifyOtp = 'user/login';
  static const String register = 'user/create-account';
  static const String getHome = 'user/home';
  static const String scheduleOrder = 'user/scheduled-order';
  static const String getAddresses = 'user/user-addresses';
  static const String addAddress = 'user/create-user-address';
  static const String updateAddress = 'user/update-address';
  static const String deleteAddress = 'user/delete-address';
  static const String allCategories = 'service/all-categories';
  static const String subCategories = 'service/sub-categories';
  static const String getSubCategoryServices = 'service/services';
  static const String availableDistricts = 'common/available-districts';
  static const String orders = 'orders';
  static const String createOrder = 'orders/create-order';
  static const String workerDetail = 'orders/worker-detail';
  static const String rescheduleOrder = 'orders/reschedule-order';
  static const String cancelOrder = 'orders/cancel-order';
  static const String verifyOrder = 'orders/verify-order';
  static const String getProfile = 'user/profile';
  static const String updateProfile = 'user/update-profile';
  static const String updatePhoneRequest = 'user/update-phone-request';
  static const String updatePhoneVerify = 'user/update-phone-verify';
  static const String updateEmailRequest = 'user/update-email-request';
  static const String updateEmailVerify = 'user/update-email-verify';
  static const String deleteAccount = 'user/delete-account';
}
