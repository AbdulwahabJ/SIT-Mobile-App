import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:sit_app/core/network/get_it.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/logic/bottom_nav_bar_cubit.dart';
import 'package:sit_app/features/auth/data/services/auth_service.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sit_app/features/customer_app/data/services/staff_service.dart';
import 'package:sit_app/features/customer_app/logic/StaffCubit/staff_cubit.dart';
import 'package:sit_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(); // تسجيل DioClient و SharedPreferences
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(GetIt.I<AuthService>()),
        ),
        BlocProvider(
          create: (context) => StaffCubit(GetIt.I<StaffService>()),
        ),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
      ],
      child: MaterialApp(
        locale: _locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        // useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
