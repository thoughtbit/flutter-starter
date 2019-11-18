import 'package:flutter/material.dart';

// 定义需要共享的数据模型，通过混入ChangeNotifier管理听众
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get counter => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}