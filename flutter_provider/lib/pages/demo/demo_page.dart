import 'package:flutter/material.dart';
import 'package:flutter_provider/models/index.dart';
import 'package:flutter_provider/routers/router.dart';

class DemoPage extends StatelessWidget {
  final String message;
  DemoPage({@required this.message});

  @override
  Widget build(BuildContext context) {
    Person person = new Person(name: "moocss", age: 28, sex: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('演示'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '演示页面$message',
              style: TextStyle(fontSize: 32.0),
            ),
            RaisedButton(
              child: Text('返回'),
              onPressed: () {
                AppRouter.goBack(context);
              }
            ),
            RaisedButton(
              child: Text('演示Provider'),
              onPressed: () {
                AppRouter.navigate(context, '/demo2');
              }
            ),
            RaisedButton(
              child: Text('返回，并且返回string'),
              onPressed: () {
                AppRouter.goBackWithParams(context, "我是返回值哦");
              },
            ),
            RaisedButton(
              child: Text('返回，并且返回int'),
              onPressed: () {
                AppRouter.goBackWithParams(context, 12);
              },
            ),
            RaisedButton(
              child: Text('返回，并且返回double'),
              onPressed: () {
                AppRouter.goBackWithParams(context, 3.1415926);
              },
            ),
            RaisedButton(
              child: Text('返回，并且返回bool'),
              onPressed: () {
                AppRouter.goBackWithParams(context, true);
              },
            ),
            RaisedButton(
              child: Text('返回，并且返回自定义类型'),
              onPressed: () {
                AppRouter.goBackWithParams(context, person);
              },
            )
          ],
        ),
      ),
    );
  }
}
