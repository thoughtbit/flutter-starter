import 'package:flutter/material.dart';
import 'package:flutter_provider/utitls/string_uril.dart';

class ArticlePage extends StatelessWidget {
  final String message;
  final String articleId;
  ArticlePage({
    @required this.message,
    @required this.articleId
  });
  @override
  Widget build(BuildContext context) {
    final msg = StringUtils.decode(message);
    return Scaffold(
      appBar: AppBar(
        title: Text('文章'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '我是文章: $msg, $articleId',
              style: TextStyle(fontSize: 32.0),
            ),
          ],
        ),
      ),
    );
  }
}
