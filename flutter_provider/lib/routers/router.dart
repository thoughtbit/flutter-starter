import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  Router _router = Router();
  static AppRouter _instance;

  factory AppRouter() {
    return _instance ??= AppRouter._internal();
  }

  AppRouter._internal() {
    _router = Router();
  }

  static RouteFactory get generator => AppRouter()._router.generator;
  static Router get _fluroRouter => AppRouter()._router;

  void defineRoute({
    @required String path,
    @required HandlerFunc handler,
  }) {
    _router.define(
      path,
      handler: Handler(
        handlerFunc: handler,
        type: HandlerType.route,
      ),
    );
  }

  void defineNotFound({
    @required HandlerFunc handler,
  }) {
    _router.notFoundHandler = Handler(
      handlerFunc: handler
    );
  }

  void defineFunction({
    @required String path,
    @required HandlerFunc handler,
  }) {
    _router.define(
      path,
      handler: Handler(
        handlerFunc: handler,
        type: HandlerType.function,
      ),
    );
  }

  static Future<dynamic> navigate(
    BuildContext context, 
    String path,
    {
      bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder,
      TransitionType transition = TransitionType.cupertino
    }
  ) {
    return _fluroRouter.navigateTo(
      context, path,
      replace: replace,
      clearStack: clearStack,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      transition: transition
    );
  }
  
  // 清除历史, 一个全新的navigate
  static Future<dynamic> freshNavigate(
    BuildContext context, 
    String path
  ) {
    return _fluroRouter.navigateTo(
      context,
      path,
      transition: TransitionType.fadeIn,
      replace: true,
      clearStack: true,
    );
  }

  // 返回
  static void goBack(BuildContext context) {
    _fluroRouter.pop(context);
  }
  // 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  // 跳转到WebView
  static void webview({BuildContext context, @required String title, @required String url}) {
    _fluroRouter.navigateTo(context, '/webview?title=$title&url=$url');
  }
}