import 'package:flutter/material.dart';
import 'package:money_manage/datafunction/datafunction.dart';
import 'package:money_manage/datafunction/dbfunction.dart';

class CategoryFloating extends StatefulWidget {
  const CategoryFloating({Key? key}) : super(key: key);

  @override
  State<CategoryFloating> createState() => _CategoryFloatingState();
}

class _CategoryFloatingState extends State<CategoryFloating> {
  final namecontrol = TextEditingController();

  Categorytype _radiovar = Categorytype.income;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: namecontrol,
                decoration: const InputDecoration(hintText: "Enter name"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Radio<Categorytype>(
                      value: Categorytype.income,
                      groupValue: _radiovar,
                      onChanged: (value) {
                        setState(() {
                          _radiovar = value!;
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Income"),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio<Categorytype>(
                      value: Categorytype.expense,
                      groupValue: _radiovar,
                      onChanged: (value) {
                        setState(() {
                          _radiovar = value!;
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
              ElevatedButton(
                  onPressed: () async {
                    var hk = [];
                    String name = namecontrol.text;
                    Categorydata addacategory = Categorydata(
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        name: name,
                        type: _radiovar);
                    await dbCategory().insertCategory(addacategory);
                    await dbCategory().getCategory();
                    // categoryList.value.add(addacategory);
                    // categoryList.notifyListeners();
                    // categoryList.value.forEach((element) {
                    //   hk.add({element.name, element.type});
                    //   print(hk);
                    // });
                    Navigator.pop(context);
                  },
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
