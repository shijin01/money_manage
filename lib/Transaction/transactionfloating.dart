import 'package:flutter/material.dart';
import 'package:money_manage/Transaction/tfunction/datamodel.dart';
import 'package:money_manage/Transaction/tfunction/transactiondb.dart';

import '../datafunction/datafunction.dart';

class TransactionFloatingAcion extends StatefulWidget {
  const TransactionFloatingAcion({Key? key}) : super(key: key);

  @override
  State<TransactionFloatingAcion> createState() =>
      _TransactionFloatingAcionState();
}

class _TransactionFloatingAcionState extends State<TransactionFloatingAcion> {
  final purpscontroll = TextEditingController();
  final amtcontroll = TextEditingController();

  Categorytype _radiovar = Categorytype.income;
  var _selecteddate = null;
  var _selecteddropdown = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                  controller: purpscontroll,
                  decoration: const InputDecoration(
                    hintText: "Purpose",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: amtcontroll,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                  onPressed: () async {
                    final selecteddatetemp = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(
                        const Duration(days: 45),
                      ),
                      lastDate: DateTime.now(),

                      // onDateChanged: (newdate) {
                      //   setState(() {
                      //     _selecteddate = newdate.toString();
                      //   });
                      //  },
                    );
                    if (selecteddatetemp == null) {
                      return;
                    } else {
                      setState(() {
                        _selecteddate = selecteddatetemp;
                      });
                    }
                  },
                  icon: const Icon(Icons.calendar_month_rounded),
                  label: Text(_selecteddate == null
                      ? "Select Date"
                      : _selecteddate.toString())),
              Row(
                children: [
                  Radio<Categorytype>(
                      value: Categorytype.income,
                      groupValue: _radiovar,
                      onChanged: (value) {
                        setState(() {
                          _radiovar = value!;
                          _selecteddropdown = null;
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Income"),
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio<Categorytype>(
                      value: Categorytype.expense,
                      groupValue: _radiovar,
                      onChanged: (value) {
                        setState(() {
                          _radiovar = value!;
                          _selecteddropdown = null;
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Expense"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                  hint: Text("Select Category"),
                  value: _selecteddropdown,
                  items: (_radiovar == Categorytype.income
                          ? incomecategoryList.value
                          : expensecategoryList.value)
                      .map((e) =>
                          DropdownMenuItem(value: e.id, child: Text(e.name)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selecteddropdown = value;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (purpscontroll.text == null ||
                        amtcontroll.text == null ||
                        _selecteddate == null ||
                        _selecteddropdown == null) {
                      return;
                    }
                    print("data get");
                    final val = TrancastinModel(
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        purpose: purpscontroll.text,
                        amt: amtcontroll.text,
                        date: _selecteddate,
                        categoryname: _selecteddropdown,
                        categorytype: _radiovar);
                    await DbTransaction().insertTransaction(val);
                    await DbTransaction().getTransaction();
                    print("Added");
                    Navigator.pop(context);
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      )),
    );
  }
}
