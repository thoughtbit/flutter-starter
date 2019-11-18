import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('计数器'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('计数器页'),
      ),
    );
  }
}