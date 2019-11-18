import 'package:flutter/material.dart';
import 'package:flutter_provider/store/index.dart';
import 'package:flutter_provider/store/models/index.dart';

class Demo2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('第二个页面发生重绘rebuild.');
    return Scaffold(
      appBar: AppBar(title: Text('Demo2Page'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('+'),
              onPressed: () {
                Store.value<CounterModel>(context).increment();
              },
            ),
            Builder(
              builder: (context) {
                print('第二个页面的计数组件发生重绘rebuild.');
                return Text(
                  '计数: ${Store.value<CounterModel>(context).counter}'
                );
              },
            ),
            RaisedButton(
              child: Text('-'),
              onPressed: () {
                Store.value<CounterModel>(context).decrement();
              },
            ),
          ],
        ),
      ),
    );
  }
}