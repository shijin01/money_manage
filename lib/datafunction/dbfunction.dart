import 'datafunction.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class DbFunction {
  Future<void> insertCategory(Categorydata value);
  Future<void> getCategory();
  Future<void> deleteCategory(String id);
}

class dbCategory implements DbFunction {
  static final dbCategory _instance = dbCategory._internal();
  dbCategory._internal();
  @override
  Future<void> deleteCategory(String id) async {
    final categorydb = await Hive.openBox<Categorydata>('Category');
    await categorydb.delete(id);

    throw UnimplementedError();
  }

  @override
  Future<void> getCategory() async {
    final categorydb = await Hive.openBox<Categorydata>('Category');
    List<Categorydata> catdat = categorydb.values.toList();
    incomecategoryList.value.clear();
    expensecategoryList.value.clear();
    catdat.forEach((element) {
      if (element.type == Categorytype.income) {
        incomecategoryList.value.add(element);
      } else {
        expensecategoryList.value.add(element);
      }
    });
    print("length:${expensecategoryList.value.length}");
    incomecategoryList.notifyListeners();
    expensecategoryList.notifyListeners();
  }

  @override
  Future<void> insertCategory(Categorydata value) async {
    final categorydb = await Hive.openBox<Categorydata>('Category');
    await categorydb.put(value.id, value);
  }

  factory dbCategory() {
    return _instance;
  }
}
