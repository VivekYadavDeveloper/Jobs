import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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
}
