import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/store/providers.dart';

class Store {
  static BuildContext context;
  static of(BuildContext context) {
    Store.context ??= context;
    return context;
  }

  static init({child, context}) {
    Store.context ??= context;
    return MultiProvider(
      child: child,
      providers: providers,
    );
  }

  static T value<T>([BuildContext context]) {
    context ??= Store.context;
    return Provider.of<T>(context);
  }

  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}