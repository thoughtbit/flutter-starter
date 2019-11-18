import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_provider/routers/index.dart';
import 'package:flutter_provider/routers/router.dart';
import 'package:flutter_provider/store/index.dart';

// 入口
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化路由配置
  initRoutes();

  // 禁止横向模式
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  ).then((_) => runApp(new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Store.init(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Boilerplate App',
          onGenerateRoute: AppRouter.generator,
          initialRoute: '/splash',
        ),
        context: context
      ),
    );
  }
}
