import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/Transaction/tfunction/datamodel.dart';
import 'package:money_manage/datafunction/datafunction.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: transactionList,
        builder: (BuildContext ct, List<TrancastinModel> newlist, Widget? _) {
          return ListView.separated(
              itemBuilder: (ctx, i) {
                return Card(
                  color: Colors.grey,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          newlist[i].categorytype == Categorytype.income
                              ? Colors.green
                              : Colors.red,
                      child: Center(
                          child: Text(
                              "${newlist[i].date.day}\n${DateFormat('MMM').format(newlist[i].date)}")),
                    ),
                    title: Text(newlist[i].amt),
                    subtitle: Text(newlist[i].purpose),
                  ),
                );
              },
              separatorBuilder: (ctx, i) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemCount: newlist.length);
        });
  }
}
