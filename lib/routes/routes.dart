import '../utils/export_files/export.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeView:
        return MaterialPageRoute(
            builder: ((context) => const PostListScreen()));
      default:
        return MaterialPageRoute(
            builder: ((context) => const Scaffold(
                  body: Text('No defined Routes'),
                )));
    }
  }
}
