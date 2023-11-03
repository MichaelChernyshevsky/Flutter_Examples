import 'package:app_with_apps/interface/screens/auth/setuser_screen.dart';
import 'package:app_with_apps/interface/screens/auth/signup_screen.dart';
import 'package:app_with_apps/interface/screens/auth/singin_screen.dart';
import 'package:app_with_apps/interface/screens/common/main_screen.dart';
import 'package:app_with_apps/interface/screens/common/screen.dart';
import 'package:app_with_apps/interface/screens/start/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String apps = '/apps_screen';
  static const String screen = '/screen';
  static const String signInScreen = '/signIn_screen';
  static const String singUpSCreen = '/signUp_screen';
  static const String setUserScreen = '/setUser_screen';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (_) => const SplashScreen(),
        signInScreen: (_) => const SignInScreen(),
        singUpSCreen: (_) => const SignUpScreen(),
        setUserScreen: (_) => const SetUserScreen(),
        apps: (_) => const MainScreen(),
        screen: (_) => const Screen(),
      };
}
