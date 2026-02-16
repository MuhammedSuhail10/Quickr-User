import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickr_user_flutter_app/application/auth/auth_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/app_details.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/app_theme.dart';
import 'package:quickr_user_flutter_app/application/core/theme/theme/theme_cubit.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/home/home_bloc.dart';
import 'package:quickr_user_flutter_app/domain/auth/i_auth_facade.dart';
import 'package:quickr_user_flutter_app/domain/core/di/injection.dart';
import 'package:quickr_user_flutter_app/presentation/start_screen/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependency(env: Environment.dev);
  runApp(const SafeArea(bottom: true, top: false, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDetails.screenSize = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ThemeCubit()), //Theme
            BlocProvider(create: (context) => HomeBloc()),
            BlocProvider(create: (context) => AuthBloc(sl<IAuthFacade>())),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                navigatorKey: AppDetails.globalNavigatorKey,
                debugShowCheckedModeBanner: false,
                title: '',
                onGenerateRoute: AppRoute.onGenerateRoute,
                initialRoute: StartScreen.routeName,
                theme: AppTheme.getTheme(AppThemeMode.light),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: Stack(children: [child!, const DropdownAlert()]),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
