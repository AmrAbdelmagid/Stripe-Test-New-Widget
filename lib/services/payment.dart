import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentProvider extends ChangeNotifier {
  Map<String, dynamic>? paymentIntentData;
  bool isSucceeded = false;

  Future<void> makePayment() async {
    final url = Uri.parse("cloud function url");
    final response =
        await http.get(url, headers: {'content-type': 'application/json'});

    paymentIntentData = json.decode(response.body);

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['paymentIntent'],
            applePay: true,
            googlePay: true,
            style: ThemeMode.dark,
            merchantCountryCode: 'US',
            merchantDisplayName: 'Vendor A'));
    notifyListeners();
    displayPaymentSheet();
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
              clientSecret: paymentIntentData!['paymentIntent'],
              confirmPayment: true));
      paymentIntentData = null;
      isSucceeded = true;
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      Timer(Duration(seconds: 2), () {
        isSucceeded = false;
        notifyListeners();
      });
    }
  }
}
