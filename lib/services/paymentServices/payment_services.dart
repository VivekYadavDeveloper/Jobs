import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../../app/constant.dart';

class PaymentServices {
  static Future payment(int amount) async {
    try {
      final paymentIntentData = await createPaymentIntent(amount);

      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Inductus Jobs',
          googlePay: const PaymentSheetGooglePay(
              merchantCountryCode: "in", currencyCode: "inr", testEnv: true),
          appearance: PaymentSheetAppearance(
              colors: PaymentSheetAppearanceColors(
                background: Colors.white,
                componentBackground: Colors.black.withOpacity(0.03),
                primary: Colors.lightBlue,
                primaryText: Colors.black,
                componentText: Colors.black,
                secondaryText: Colors.black38,
                placeholderText: Colors.black45,
                icon: Colors.black,
              ),
              primaryButton: const PaymentSheetPrimaryButtonAppearance(
                  colors: PaymentSheetPrimaryButtonTheme(
                      dark: PaymentSheetPrimaryButtonThemeColors(
                          background: Colors.white)))),
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
      }
      displayPaymentSheet();
      // await Stripe.instance.presentPaymentSheet();
    } catch (e, s) {
      print("Exception Happened====> 💥💥💥 $e $s");
    }
  }

  //** Display The Payment Sheet Function
  static displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfully");
      });
    } catch (e) {
      print("Show PopUp Mai Errror =====> 🐱‍👤🐱‍👤🐱‍👤🐱‍👤 $e");
    }
  }

  // ** Payment Create Function
  static createPaymentIntent(int amount) async {
    try {
      final Map<String, String> bodyData = {
        "amount": calculateAmount(amount),
        "currency": "inr",
        "payment_method_types[]": 'card',
      };
      print("Payment Body ---------> ⛹️‍♀️⛹️‍♀️⛹️‍♀️⛹️‍♀️ $bodyData");

      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: bodyData,
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      print("Payment Res(Body) ====> 🚾🚾🚾🚾 ${response.body}");
      print("Payment Res(STATUS CODE) ====> 🚾🚾🚾🚾 ${response.statusCode}");

      final jsonData = jsonDecode(response.body);
      print("Payment Res(Json Body) ====>😎😎😎😎 ${response.body}");
      return jsonData;
    } catch (e) {
      return null;
    }
  }
}

// Calculate The Amount
String calculateAmount(int amount) {
  final a = (amount) * 10;
  return a.toString();
}
