import 'package:app_with_apps/interface/screens/common/screen.dart';
import 'package:app_with_apps/interface/screens/main_screen.dart';
import 'package:app_with_apps/interface/screens/start/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String apps = '/apps_screen';
  static const String screen = '/screen';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (_) => const SplashScreen(),
        apps: (_) => const MainScreen(),
        screen: (_) => const Screen(),
      };
}
