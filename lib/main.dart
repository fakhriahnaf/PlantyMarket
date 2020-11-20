//import 'package:PlantyMarket/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(), //PaymentPage(transaction: Transaction(items : mockItems[0], users: mockUsers, quantity: 2)),
      //SignInPage(),
    );
  }
}
