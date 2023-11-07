import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_manage/datafunction/datafunction.dart';
part 'datamodel.g.dart';

@HiveType(typeId: 3)
class TrancastinModel {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String purpose;
  @HiveField(2)
  late String amt;
  @HiveField(3)
  late DateTime date;
  @HiveField(4)
  late Categorytype categorytype;
  @HiveField(5)
  late String categoryname;
  TrancastinModel({
    required this.id,
    required this.purpose,
    required this.amt,
    required this.date,
    required this.categorytype,
    required this.categoryname,
  });
}

ValueNotifier<List<TrancastinModel>> transactionList = ValueNotifier([]);
