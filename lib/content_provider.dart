import 'package:flutter/material.dart';

class ContentProvider with ChangeNotifier {
  int _counter = 0;

  get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  final List<String> _shoppingCart = [
    "Shoes",
    "Pants",
    "Books",
    "Mobiles",
    "T-Shirts",
  ];

  int get cartItem => _shoppingCart.length;
  List<String> get cart => _shoppingCart;
  void addItems(String item) {
    _shoppingCart.add(item);
    notifyListeners();
  }

  // final List<DummyModel> _farziList = [
  //   // DummyModel(favourite: "qwer", name: "gkjh", desc: "ghjfg", member: 23),
  //   // DummyModel(favourite: "ejds", name: "ewiodjjh", desc: "ghjfg", member: 545),
  // ];
  // List<DummyModel> get farziList => _farziList;
  //
  // void addDummyItems(DummyModel item) {
  //   _farziList.add(item);
  //   notifyListeners();
  // }
}
