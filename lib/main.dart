import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:stripe_new_test/services/payment.dart';
import 'package:stripe_new_test/widgets/dashboard_page.dart';

void main() {
  Stripe.publishableKey =
      'pk_test_51JQdIOLIQnmihNYkFs69YfO2pKfL9HluUGT369bvYeTObvLURt2PJdrrmhiAyy5eYmXF9VIDtXylGcuUlSWskvk100fa9PVSus';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashBoardPage(),
      ),
    );
  }
}
