import 'package:flutter/material.dart';
import 'package:money_manage/datafunction/datafunction.dart';
import 'package:money_manage/datafunction/dbfunction.dart';

class CategoryExpenseList extends StatelessWidget {
  const CategoryExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: expensecategoryList,
        builder: (BuildContext context, List<Categorydata> newcatogorylist, _) {
          return ListView.separated(
              itemBuilder: (ctx, i) {
                return Card(
                    color: Colors.grey[350],
                    child: ListTile(
                      title: Text(newcatogorylist[i].name),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          dbCategory().deleteCategory(newcatogorylist[i].id);
                          dbCategory().getCategory();
                        },
                      ),
                    ));
              },
              separatorBuilder: (ctx, i) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: newcatogorylist.length);
        });
  }
}
