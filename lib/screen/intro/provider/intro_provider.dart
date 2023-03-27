import 'package:flutter/material.dart';

class IntroProvider extends ChangeNotifier {
  bool isLastPage = false;
  List imageList = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
  ];

  void lastPage(int index) {
    isLastPage = index == 2;
    notifyListeners();
  }
}
