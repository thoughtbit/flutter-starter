import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('关于页'),
      ),
    );
  }
}