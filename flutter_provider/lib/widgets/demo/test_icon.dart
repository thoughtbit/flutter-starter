import 'package:flutter/material.dart';

// 用于打印build方法执行情况的自定义控件
class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TestIcon rebuild");
    return Icon(Icons.add);//返回Icon实例
  }
}