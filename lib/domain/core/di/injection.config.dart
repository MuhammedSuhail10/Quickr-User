// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../application/address/address_bloc.dart' as _i844;
import '../../../application/booking/booking_bloc.dart' as _i729;
import '../../../application/core/service/dio_client.dart' as _i536;
import '../../../application/home/home_bloc.dart' as _i485;
import '../../../application/orders/orders_bloc.dart' as _i615;
import '../../../application/profile/profile_bloc.dart' as _i694;
import '../../../infrastructure/address/i_address_facade_impl.dart' as _i21;
import '../../../infrastructure/auth/i_auth_facade_impl.dart' as _i720;
import '../../../infrastructure/auth_local/i_auth_local_facade_impl.dart'
    as _i950;
import '../../../infrastructure/booking/i_booking_facade_impl.dart' as _i284;
import '../../../infrastructure/home/i_home_facade_impl.dart' as _i941;
import '../../../infrastructure/orders/i_orders_facade_impl.dart' as _i1072;
import '../../../infrastructure/profile/i_profile_facade_impl.dart' as _i797;
import '../../address/i_address_facade.dart' as _i766;
import '../../auth/i_auth_facade.dart' as _i551;
import '../../auth_local/i_auth_local_facade.dart' as _i568;
import '../../booking/i_booking_facade.dart' as _i50;
import '../../home/i_home_facade.dart' as _i490;
import '../../orders/i_orders_facade.dart' as _i858;
import '../../profile/i_profile_facade.dart' as _i108;
import '../base/run_safely.dart' as _i530;
import 'app_injection_module.dart' as _i975;
import 'local_notification_serveice.dart' as _i793;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appInjectionModule = _$AppInjectionModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appInjectionModule.pref(),
    preResolve: true,
  );
  await gh.factoryAsync<_i975.PermissionHandler>(
    () => appInjectionModule.reqPermission(),
    preResolve: true,
  );
  await gh.factoryAsync<_i793.LocalNotification>(
    () => appInjectionModule.initLocalNotification(),
    preResolve: true,
  );
  gh.lazySingleton<_i530.RunSafely>(() => _i530.RunSafely());
  gh.lazySingleton<_i361.Dio>(() => appInjectionModule.dio);
  gh.lazySingleton<_i568.IAuthLocalFacade>(
    () => _i950.IAuthLocalFacadeImpl(gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i536.DioClient>(() => _i536.DioClient(gh<_i361.Dio>()));
  gh.lazySingleton<_i490.IHomeFacade>(
    () => _i941.IHomeFacadeImpl(
      dioClient: gh<_i536.DioClient>(),
      runSafely: gh<_i530.RunSafely>(),
    ),
  );
  gh.factory<_i485.HomeBloc>(() => _i485.HomeBloc(gh<_i490.IHomeFacade>()));
  gh.lazySingleton<_i858.IOrdersFacade>(
    () => _i1072.IOrdersFacadeImpl(
      dioClient: gh<_i536.DioClient>(),
      runSafely: gh<_i530.RunSafely>(),
    ),
  );
  gh.lazySingleton<_i108.IProfileFacade>(
    () => _i797.IProfileFacadeImpl(
      dioClient: gh<_i536.DioClient>(),
      runSafely: gh<_i530.RunSafely>(),
    ),
  );
  gh.lazySingleton<_i766.IAddressFacade>(
    () => _i21.IAddressFacadeImpl(
      dioClient: gh<_i536.DioClient>(),
      runSafely: gh<_i530.RunSafely>(),
    ),
  );
  gh.lazySingleton<_i551.IAuthFacade>(
    () => _i720.IAuthFacadeImpl(
      dioClient: gh<_i536.DioClient>(),
      runSafely: gh<_i530.RunSafely>(),
    ),
  );
  gh.lazySingleton<_i50.IBookingFacade>(
    () => _i284.IBookingFacadeImpl(
      dioClient: gh<_i536.DioClient>(),
      runSafely: gh<_i530.RunSafely>(),
    ),
  );
  gh.factory<_i844.AddressBloc>(
    () => _i844.AddressBloc(gh<_i766.IAddressFacade>()),
  );
  gh.factory<_i729.BookingBloc>(
    () => _i729.BookingBloc(gh<_i50.IBookingFacade>()),
  );
  gh.factory<_i615.OrdersBloc>(
    () => _i615.OrdersBloc(gh<_i858.IOrdersFacade>()),
  );
  gh.factory<_i694.ProfileBloc>(
    () => _i694.ProfileBloc(gh<_i108.IProfileFacade>()),
  );
  return getIt;
}

class _$AppInjectionModule extends _i975.AppInjectionModule {}
