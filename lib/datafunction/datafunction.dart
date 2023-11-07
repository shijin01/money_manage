import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
part 'datafunction.g.dart';

@HiveType(typeId: 2)
enum Categorytype {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class Categorydata {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late Categorytype type;
  @HiveField(3)
  bool isdiabled = false;

  Categorydata({required this.id, required this.name, required this.type});
}

ValueNotifier<List<Categorydata>> incomecategoryList = ValueNotifier([]);
ValueNotifier<List<Categorydata>> expensecategoryList = ValueNotifier([]);
