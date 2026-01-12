import 'package:flutter/material.dart';
import 'package:test_app/features/auth/data/presentation/screens/login_screen.dart';
import 'package:test_app/features/challenge/presentation/screens/changelle_screen.dart';
import 'package:test_app/features/home/presentation/screens/home_screen.dart';
import 'package:test_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:test_app/features/settings/presentatation/presentation/settings_screen.dart';
import 'package:test_app/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const profile = '/profile';
  static const changelle = '/changelle';
  static const settings = '/settings';


  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
    profile: (context) => ProfileScreen(),
    changelle: (context) => ChangelleScreen(),
    settings: (context) => SettingsScreen(),
  };


}