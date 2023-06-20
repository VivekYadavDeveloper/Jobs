import 'package:flutter/material.dart';

import '../../services/payment/payment_services.dart';

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
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
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
  }}