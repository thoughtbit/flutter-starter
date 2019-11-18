import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('欢迎页'),
      ),
    );
  }
}