import 'package:flutter_provider/pages/common/page_notfound_page.dart';
import 'package:flutter_provider/routers/router.dart';
import 'package:flutter_provider/pages/index.dart';
import 'package:flutter_provider/widgets/index.dart';

void initRoutes() {
  AppRouter router = AppRouter();

  router.defineRoute(path: '/webview', handler: (_, params) {
    String url = params['url']?.first;
    String title = params['title']?.first ?? '浏览器';
    return WebView(
      url: url,
      title: title     
    );
  });

  router.defineNotFound(handler: (_, __) => NotFoundPage());
  router.defineRoute(path: '/', handler: (_, __) => HomePage());
  router.defineRoute(path: '/splash', handler: (_, __) => SplashPage());
  router.defineRoute(path: '/search/:search', handler: (_, params) {
    String search = params['search'][0];
    return SearchPage(search: search);
  });

  router.defineRoute(path: '/demo', handler: (_, params) {
    String message = params['message']?.first;
    return DemoPage(message: message);
  });
  router.defineRoute(path: '/demo2', handler: (_, __) => Demo2Page());

  router.defineRoute(path: '/article', handler: (_, params) {
    String message = params["message"]?.first;
    String articleId = params["article_id"]?.first;
    return ArticlePage(message: message, articleId: articleId);
  });
}
