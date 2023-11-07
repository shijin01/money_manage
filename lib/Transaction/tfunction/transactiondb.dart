import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manage/Transaction/tfunction/datamodel.dart';

abstract class Transactiondb {
  Future<void> insertTransaction(TrancastinModel value);
  Future<void> getTransaction();
  Future<void> deleteCategory(String id);
}

class DbTransaction implements Transactiondb {
  static final DbTransaction _instance = DbTransaction._internal();
  DbTransaction._internal();
  factory DbTransaction() {
    return _instance;
  }

  @override
  Future<void> deleteCategory(String id) async {
    final transactiondb = await Hive.openBox<TrancastinModel>('Transationdb');
  }

  @override
  Future<void> getTransaction() async {
    final transactiondb = await Hive.openBox<TrancastinModel>('Transationdb');
    transactionList.value.clear();
    transactionList.value.addAll(transactiondb.values.toList());
    transactionList.notifyListeners();
  }

  @override
  Future<void> insertTransaction(TrancastinModel value) async {
    final transactiondb = await Hive.openBox<TrancastinModel>('Transationdb');
    await transactiondb.put(value.id, value);
  }
}
