import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:inductus_jobs/services/paymentServices/payment_services.dart';
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
    return MaterialApp(
      title: 'InductusJob',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StripeScreen(title: 'Pay Your Bills'),
    );
  }
}

class StripeScreen extends StatefulWidget {
  const StripeScreen({super.key, required this.title});

  final String title;

  @override
  State<StripeScreen> createState() => _StripeScreenState();
}

class _StripeScreenState extends State<StripeScreen> {
  //** To Store The Payment Intent Details After Making Payment ;
  Map<String, dynamic>? paymentIntent;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press The Button To Make Payment',
            ),
            ElevatedButton(
                onPressed: () {
                  PaymentServices.payment(10);
                },
                child: const Text("Pay Your Bill"))
          ],
        ),
      ),
    );
  }

Future<void> payment() async {
  try {
    paymentIntent = await createPaymentIntent('1000', 'INR');

    var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: "IN", currencyCode: "INR", testEnv: true);

    //STEP 2: Initialize Payment Sheet
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntent![
                    'client_secret'], //Gotten from payment intent
                style: ThemeMode.light,
                merchantDisplayName: 'Inductus',
                googlePay: gpay))
        .then((value) {});

    //STEP 3: Display Payment sheet
    displayPaymentSheet();
  } catch (err) {
    print(err);
  }
}

// ** Display Sheet Function
displayPaymentSheet() async {
  try {
    await Stripe.instance.presentPaymentSheet().then((value) {
      print("Payment Successfully");
    });
  } catch (e) {
    print('$e');
  }
}

createPaymentIntent(String amount, String currency) async {
  try {
    Map<String, dynamic> body = {
      'amount': amount,
      'currency': currency,
    };

    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: body,
    );
    return json.decode(response.body);
  } catch (err) {
    throw Exception(err);
  }
}
}
