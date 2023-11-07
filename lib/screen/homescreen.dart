import 'package:flutter/material.dart';
import 'package:money_manage/screen/Navigationbar.dart';

import '../Transaction/transactionscreen.dart';
import '../category/Categoryscreen.dart';
import '../main.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final homes = [const TransactionScreen(), const CategoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print(MyApp.indx.value);
          if (MyApp.indx.value == 1) {
            Navigator.of(context).pushNamed('addcategory');
          } else if (MyApp.indx.value == 0) {
            Navigator.of(context).pushNamed('addtransaction');
          }
        },
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: MyApp.indx,
            builder: (ctx, int iv, _) {
              return homes[iv];
            }),
      ),
      bottomNavigationBar: const NavigationScreen(),
      appBar: AppBar(
        title: const Center(child: Text("Money Management")),
      ),
    );
  }
}
