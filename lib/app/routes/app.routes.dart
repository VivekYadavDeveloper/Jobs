import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inductus_jobs/view/loginScreen/login.screen.dart';
import 'package:inductus_jobs/view/registrationScreen/resgistration.screen.dart';
import 'package:inductus_jobs/view/splashScreen/splash.screen.dart';

import '../../view/bottomNavigationBar/bottom.navigationbar.dart';
import '../../view/homeScreen/homeScreen.dart';

class AppRoutes {
  static const String splashRoute = "/splashScreen";
  static const String loginRoute = "/loginScreen";
  static const String signUpRoute = "/signScreen";
  static const String forgotRoute = "/forgotPasswordScreen";
  static const String navigationBarRoute = "/navigationScreen";
  static const String homeRoute = "/homeScreen";
  static const String profileRoute = "/profileScreen";
  static const String otpRoute = "/otpScreen";
  static const String detailRoute = "/detailScreen";
  static const String editProfileRoute = "/editProfileScreen";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        {
          return MaterialPageRoute(builder: (_) => SplashScreen());
        }
      case loginRoute:
        {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }
      case signUpRoute:
        {
          return MaterialPageRoute(builder: (_) => RegistrationScreen());
        }
      case navigationBarRoute:
        {
          return MaterialPageRoute(builder: (_) => NavigationBarScreen());
        }
      // case homeRoute:
      //   {
      //     return MaterialPageRoute(builder: (_) => HomeScreen());
      //   }
    }
  }
}
