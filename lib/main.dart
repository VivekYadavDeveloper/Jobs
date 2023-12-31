import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/app/routes/app.routes.dart';

import 'app/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//* PublishableKey We Get When Create Account In Stripe.
  Stripe.publishableKey = stripePublishKey;
  // "Write here your publishable key here";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Inductus Job',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: AppColors.primaryColor,
                  iconTheme: IconThemeData(color: AppColors.activeColor)),
              primaryColor: AppColors.primaryColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              fontFamily: GoogleFonts
                  .poppins()
                  .fontFamily,
              scaffoldBackgroundColor: AppColors.primaryColor,
              useMaterial3: true,
            ),
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: AppRoutes.splashRoute,
          );
        });
  }
}
