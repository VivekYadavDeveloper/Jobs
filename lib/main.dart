import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:inductus_jobs/view/loginScreen/login.screen.dart';
import 'package:inductus_jobs/view/registrationScreen/resgistration.screen.dart';
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
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Inductus Job',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: RegistrationScreen(),
          );
        });
  }
}
