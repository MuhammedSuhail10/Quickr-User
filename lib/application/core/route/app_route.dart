import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quickr_user_flutter_app/application/core/app_details.dart';
import 'package:quickr_user_flutter_app/application/core/utils/logger.dart';
import 'package:quickr_user_flutter_app/presentation/auth/login_screen.dart';
import 'package:quickr_user_flutter_app/presentation/auth/otp_screen.dart';
import 'package:quickr_user_flutter_app/presentation/auth/registration_screen.dart';
import 'package:quickr_user_flutter_app/presentation/home/main_screen.dart';
import 'package:quickr_user_flutter_app/presentation/orders/order_main_screen.dart';
import 'package:quickr_user_flutter_app/presentation/profile/edit_email_address.dart';
import 'package:quickr_user_flutter_app/presentation/profile/edit_phone_number.dart';
import 'package:quickr_user_flutter_app/presentation/profile/profile_screen.dart';
import 'package:quickr_user_flutter_app/presentation/profile/profile_update_screen.dart';
import 'package:quickr_user_flutter_app/presentation/profile/saved_addresses_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/add_new_address.dart';
import 'package:quickr_user_flutter_app/presentation/services/booking_success_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/extra_information_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/location_selecting_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_booking_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_details_screen.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_selection_screen.dart';
import 'package:quickr_user_flutter_app/presentation/splash_screen.dart';
import 'package:quickr_user_flutter_app/presentation/start_screen/start_screen.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Logger.logWarning(
      'Route Name: ${settings.name},  Arguments: ${settings.arguments}, ArgumentType: ${settings.arguments.runtimeType}',
    );
    final arguments = (settings.arguments as Map<String, dynamic>?);

    switch (settings.name) {
      case StartScreen.routeName:
        return pushRoute(settings, const StartScreen());

      case MainScreen.routeName:
        return pushRoute(settings, const MainScreen());

      case ServiceDetailsScreen.routeName:
        return pushRoute(settings, const ServiceDetailsScreen());

      case LoginScreen.routeName:
        return pushRoute(settings, const LoginScreen());

      case OtpScreen.routeName:
        return pushRoute(settings, const OtpScreen());

      case RegistrationScreen.routeName:
        return pushRoute(settings, const RegistrationScreen());

      case ServiceSelectionScreen.routeName:
        return pushRoute(settings, const ServiceSelectionScreen());

      case ServiceBookingScreen.routeName:
        return pushRoute(settings, const ServiceBookingScreen());

      case AddNewAddress.routeName:
        return pushRoute(settings, const AddNewAddress());

      case ExtraInformationScreen.routeName:
        return pushRoute(settings, const ExtraInformationScreen());

      case BookingSuccessScreen.routeName:
        return pushRoute(settings, const BookingSuccessScreen());

      case OrderMainScreen.routeName:
        return pushRoute(settings, const OrderMainScreen());

      case SavedAddressesScreen.routeName:
        return pushRoute(settings, const SavedAddressesScreen());

      case ProfileScreen.routeName:
        return pushRoute(settings, const ProfileScreen());

      case EditPhoneNumber.routeName:
        return pushRoute(settings, const EditPhoneNumber());

      case EditEmailAddress.routeName:
        return pushRoute(settings, const EditEmailAddress());

      case ProfileUpdateScreen.routeName:
        return pushRoute(settings, const ProfileUpdateScreen());

      case LocationSelectingScreen.routeName:
        return pushRoute(settings, const LocationSelectingScreen());

      case SplashScreen.routeName:
      default:
        return pushRoute(settings, const SplashScreen());
    }
  }

  static Route<dynamic> pushRoute(RouteSettings settings, Widget screen) {
    return PageTransition(
      settings: settings,
      child: screen,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 400),
      type: PageTransitionType.rightToLeft,
    );
  }

  static Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return AppDetails.globalNavigatorKey.currentState!.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Generic pushReplacementNamed method
  static Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    Object? arguments,
  }) {
    return AppDetails.globalNavigatorKey.currentState!
        .pushReplacementNamed<T, TO>(routeName, arguments: arguments);
  }

  /// Generic pushNamedAndRemoveUntil method
  static Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return AppDetails.globalNavigatorKey.currentState!
        .pushNamedAndRemoveUntil<T>(
          routeName,
          predicate ?? (_) => false, // Default removes all previous routes
          arguments: arguments,
        );
  }

  /// Generic pop method
  static void pop<T>([T? result]) {
    AppDetails.globalNavigatorKey.currentState!.pop<T>(result);
  }

  /// Generic popUntil method
  static void popUntil(bool Function(Route<dynamic>) predicate) {
    AppDetails.globalNavigatorKey.currentState!.popUntil(predicate);
  }

  /// Pop Until + Refresh Route With Arguments
  static void popUntilAndReplaceWithArgs(
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    final navigator = AppDetails.globalNavigatorKey.currentState!;
    navigator.popUntil(predicate);
    navigator.pushReplacementNamed(
      ServiceDetailsScreen.routeName,
      arguments: arguments,
    );
  }
}
