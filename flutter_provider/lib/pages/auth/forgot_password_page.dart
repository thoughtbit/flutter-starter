import 'package:flutter/material.dart';

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('找回密码'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('找回密码页'),
      ),
    );
  }
}