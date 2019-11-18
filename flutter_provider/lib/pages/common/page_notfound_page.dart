import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('页面被外星人劫持了'),
      ),
    );
  }
}