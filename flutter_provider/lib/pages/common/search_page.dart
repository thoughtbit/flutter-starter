import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String search;

  const SearchPage({Key key, this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索: $search'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('搜索页'),
      ),
    );
  }
}