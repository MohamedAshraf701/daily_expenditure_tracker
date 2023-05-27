import 'package:daily_expenditure_tracker/Screens/Demo.dart';
import 'package:daily_expenditure_tracker/Screens/AddExpense.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../Screens/homeScreen.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;
  bool Loader = false;

  List screens = [homeScreen(), addExpense(), Demo()];
  selctedIndexChange(int i) {
    selectedIndex = i;
    update();
  }
}
