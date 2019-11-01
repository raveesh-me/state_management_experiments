import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  // making it a singleton
  static final Counter singleton = Counter._internal();
  // default constructor factory replacement
  factory Counter() => singleton;
  // private internal constructor
  Counter._internal() {
    _count = 0;
  }

  int _count;
  int get count => _count;
  increment() {
    _count++;
    notifyListeners();
  }
}
