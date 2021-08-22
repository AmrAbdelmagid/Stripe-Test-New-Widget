import 'package:flutter/material.dart';
import 'package:stripe_new_test/services/payment.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Test'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Pay Amount'),
          onPressed: () {
            // makePayment();
          },
        ),
      ),
    );
  }
}
