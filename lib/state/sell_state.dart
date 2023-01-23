import 'package:flutter/material.dart';

class SellState extends ChangeNotifier {
  int counter;
  String price;
  int total;

  SellState({required this.counter, required this.price, required this.total});

  void increment() {
    counter++;
    calculateTotal(counter);
    notifyListeners();
  }

  void decrement() {
    counter--;
    if (counter < 0) counter = 0;
    calculateTotal(counter);
    notifyListeners();
  }

  void calculateTotal(int counter) {
    total = int.parse(price) * counter;
    notifyListeners();
  }
}
