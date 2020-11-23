//import 'package:PlantyMarket/models/models.dart';
import 'cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'cubit/transaction_cubit.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create : (_)=> UserCubit()),
        BlocProvider(create : (_)=> ItemCubit()),
        BlocProvider(create: (_)=> TransactionCubit())
      ],
        child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(), //PaymentPage(transaction: Transaction(items : mockItems[0], users: mockUsers, quantity: 2)),
        //SignInPage(),
      ),
    );
  }
}
