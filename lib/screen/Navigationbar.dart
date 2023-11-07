// ignore: file_names
import 'package:flutter/material.dart';
import 'package:money_manage/main.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Transaction"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Category"),
      ],
      currentIndex: MyApp.indx.value,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      onTap: (value) {
        setState(() {
          MyApp.indx.value = value;
        });
        if (MyApp.indx.value == 0) {
          print("Transaction");
        } else {
          print("Category");
        }
      },
    );
  }
}
