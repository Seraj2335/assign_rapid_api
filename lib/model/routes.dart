import 'package:go_router/go_router.dart';

import '../view/screens/home_page/home_page.dart';
import '../view/screens/news_details.dart';

class Routes {
  static const initialPath = '/';
  static const initialName = 'home';

  static const newsDetailsPath = '/newsDetails';
  static const newsDetails = 'newsDetails';

  static GoRouter goRoute() => GoRouter(
        initialLocation: initialPath,
        routes: <RouteBase>[
          GoRoute(
              name: initialName,
              path: initialPath,
              builder: (context, state) => MyHomePage()),
          GoRoute(
              name: newsDetails,
              path: newsDetailsPath,
              builder: (context, state) {
                final newsId = state.extra as int;
                return NewsDetails(newsId: newsId);
              }),
        ],
    restorationScopeId: 'app'
      );
}
