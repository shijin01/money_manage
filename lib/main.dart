import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manage/Transaction/tfunction/datamodel.dart';
import 'package:money_manage/Transaction/tfunction/transactiondb.dart';
import 'package:money_manage/Transaction/transactionfloating.dart';
import 'package:money_manage/category/widget/categoryfloating.dart';
import 'package:money_manage/datafunction/datafunction.dart';
import 'package:money_manage/datafunction/dbfunction.dart';
import 'package:money_manage/screen/homescreen.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.initFlutter(documentDirectory.path);

  if (!Hive.isAdapterRegistered(CategorydataAdapter().typeId)) {
    Hive.registerAdapter(CategorydataAdapter());
  }
  if (!Hive.isAdapterRegistered(CategorytypeAdapter().typeId)) {
    Hive.registerAdapter(CategorytypeAdapter());
  }
  if (!Hive.isAdapterRegistered(TrancastinModelAdapter().typeId)) {
    Hive.registerAdapter(TrancastinModelAdapter());
  }
  dbCategory().getCategory();
  DbTransaction().getTransaction();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static ValueNotifier<int> indx = ValueNotifier(0);
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      'addcategory': (ctx) {
        return const CategoryFloating();
      },
      "addtransaction": (cxt) {
        return const TransactionFloatingAcion();
      },
    }, home: homeScreen());
  }
}
