// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:money_manage/category/widget/expenselist.dart';
import 'package:money_manage/category/widget/incomelist.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late final tabcntl;

  @override
  void initState() {
    // TODO: implement initState
    tabcntl = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TabBar(
              labelColor: Colors.amber[200],
              unselectedLabelColor: Colors.grey[400],
              padding: EdgeInsets.all(15),
              controller: tabcntl,
              tabs: [Text("INCOME"), Text("EXPENSE")]),
          Expanded(
            child: TabBarView(controller: tabcntl, children: const [
              Center(
                child: CategoryIncomeList(),
              ),
              Center(
                child: CategoryExpenseList(),
              )
            ]),
          )
        ],
      ),
    );
  }
}
