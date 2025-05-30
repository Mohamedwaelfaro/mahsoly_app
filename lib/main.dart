import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahsoly_app1/payment/dio_helper.dart' show DioHelper;

import 'onboarding/onboarding_screen.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
            ).copyWith(secondary: Colors.greenAccent),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.green),
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: Colors.black87,
              contentTextStyle: TextStyle(color: Colors.white),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: const Color(0xFF181818),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF232323),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.dark,
              primarySwatch: Colors.green,
            ).copyWith(secondary: Colors.greenAccent),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.greenAccent),
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: Colors.white,
              contentTextStyle: TextStyle(color: Colors.black),
            ),
          ),
          themeMode: ThemeMode.system,
          home: const OnboardingScreen(),
        );
      },
    );
  }
}
