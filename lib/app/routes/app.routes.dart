import 'package:flutter/material.dart';
import 'package:inductus_jobs/view/Hire%20View/hireForgotPasswordScreen/hire.forgot.password.screen.dart';
import 'package:inductus_jobs/view/Hire%20View/hireOtpScreen/hire.otp.screen.dart';
import 'package:inductus_jobs/view/Hire%20View/hireRegistrationScreen/hire.registration.screen.dart';

import 'package:inductus_jobs/view/forgotPasswordScreen/forgot.password.screen.dart';
import 'package:inductus_jobs/view/loginScreen/login.screen.dart';
import 'package:inductus_jobs/view/otpVerificationScreen/otp.verification.screen.dart';
import 'package:inductus_jobs/view/registrationScreen/resgistration.screen.dart';
import 'package:inductus_jobs/view/settingScreen/setting.screen.dart';
import 'package:inductus_jobs/view/splashScreen/splash.screen.dart';

import '../../view/Hire View/hireLoginScreen/hire.login.screen.dart';
import '../../view/Hire View/hireProfileScreen/hire.job.form.screen.dart';
import '../../view/bottomNavigationBar/bottom.navigationbar.dart';
import '../../view/settingScreen/notificationScreen/notification.screen.dart';

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
  static const String notificationRoute = "/notificationScreen";
  static const String settingRoute = "/settingScreen";

  //** Recruiter Routing
  static const String hireLoginRoute = "/hireLoginScreen";
  static const String hireForgotPassRoute = "/hireForgotPassScreen";
  static const String hireOtpRoute = "/hireOtpVerificationScreen";
  static const String hireRegistrationRoute = "/hireRegistrationScreen";
  static const String hireJobPostFormRoute = "/hireJobPostFormScreen";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      case loginRoute:
        {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }
      case hireLoginRoute:
        {
          return MaterialPageRoute(builder: (_) => HireLoginScreen());
        }
      case hireJobPostFormRoute:
        {
          return MaterialPageRoute(builder: (_) => HireJobFormScreen());
        }

      case hireRegistrationRoute:
        {
          return MaterialPageRoute(
              builder: (_) => const HireRegistrationScreen());
        }
      case hireForgotPassRoute:
        {
          return MaterialPageRoute(builder: (_) => HireForgotPasswordScreen());
        }
      case hireOtpRoute:
        {
          return MaterialPageRoute(
              builder: (_) => const HireOtpVerificationScreen());
        }

      case signUpRoute:
        {
          return MaterialPageRoute(builder: (_) => const RegistrationScreen());
        }
      case forgotRoute:
        {
          return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
        }
      case otpRoute:
        {
          return MaterialPageRoute(
              builder: (_) => const OtpVerificationScreen());
        }
      case navigationBarRoute:
        {
          return MaterialPageRoute(builder: (_) => const NavigationBarScreen());
        }
      case notificationRoute:
        {
          return MaterialPageRoute(builder: (_) => const NotificationScreen());
        }
      case settingRoute:
        {
          return MaterialPageRoute(builder: (_) => const SettingScreen());
        }
    }
  }
}
