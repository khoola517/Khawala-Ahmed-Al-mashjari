import 'package:finallproject/core/view/Homescreen.dart';
import 'package:finallproject/core/view/VaccineListView.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../view/vaccine_screen.dart';

class HomePageController with ChangeNotifier {
  int _currentIndex = 0;
  List<String> titles = ["9".tr, "24".tr, "13".tr];
  List<Widget> screen = [
    IndexPage(),
    VaccineListView(),
    VaccineScreen(),
  ];

  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners(); 
  }
}
// class HomePageController extends GetxController{
//   List<String> titles =[
//     "9".tr,
//     "38".tr,
//     "37".tr,
//   ];
//   List<Widget> screen = [
//     const Homescreen(),
//      VaccineListView(),
//     const Profile(),
//   ];
//  int currentindex = 0; 
// }