import 'package:flutter/material.dart';
import 'package:flutter_provider/models/index.dart';
import 'package:flutter_provider/routers/router.dart';
import 'package:flutter_provider/store/index.dart';
import 'package:flutter_provider/store/models/index.dart';
import 'package:flutter_provider/utitls/string_uril.dart';
import 'package:flutter_provider/widgets/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '首页页面',
              style: TextStyle(fontSize: 32.0),
            ),
            Store.connect<CounterModel>(
              builder: (context, snapshot, child) {
                return RaisedButton(
                  child: Text('+'),
                  onPressed: () {
                    snapshot.increment();
                  },
                );
              }
            ),
            Store.connect<CounterModel>(
              builder: (context, snapshot, child) {
                print('第一个页面的计数组件发生重绘rebuild.');
                return Text(
                  '计数: ${snapshot.counter}'
                );
              },
            ),
            Store.connect<CounterModel>(
              builder: (context, snapshot, child) {
                return RaisedButton(
                  child: Text('-'),
                  onPressed: () {
                    snapshot.decrement();
                  },
                );
              }
            ),
            RaisedButton(
              child: Text('首页页面'),
              onPressed: () {
                AppRouter.navigate(context, '/');
              }
            ),
            RaisedButton(
              child: Text('演示页面传入和接收返回值'),
              onPressed: () {
                String message = 'hello';
                AppRouter.navigate(context, '/demo?message=$message').then((result) {
                  debugPrint('演示: ${result.runtimeType}');
                  String message;
                  if (result.runtimeType == Person) {
                    message = result.toJson().toString();
                    debugPrint('${result.toJson().toString()}');
                  } else {
                    message = '$result';
                    debugPrint('$result');
                  }
                  showResultDialog(context, message);
                });
              }
            ),
            RaisedButton(
              child: Text('文章页面'),
              onPressed: () {
                String message = StringUtils.encode('Flutter 入门到放弃');
                String articleId = '2019110900001';
                 
                AppRouter.navigate(context, '/article?message=$message&article_id=$articleId');
              }
            ),
          ],
        ),
      ),
      floatingActionButton: WidgetAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
 // 显示一个Dialgo
  void showResultDialog(BuildContext context,String message){
    showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text(
            "Hey Hey!",
            style: new TextStyle(
              color: const Color(0xFF00D6F7),
              fontFamily: "Lazer84",
              fontSize: 22.0,
            ),
          ),
          content: new Text("$message"),
          actions: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: new Text("OK"),
              ),
            ),
          ],
        );
      },
    );
  }
}

class WidgetAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetAction build');
    return Store.connect<CounterModel>(
      builder: (context, snapshot, child) {
        print('第一个页面的WidgetAction组件发生重绘rebuild.');
        return FloatingActionButton(
          onPressed: snapshot.increment,
          child: child,
        );
      },
      child: TestIcon(),
    );
  }
}