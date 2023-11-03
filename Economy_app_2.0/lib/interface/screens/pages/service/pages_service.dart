import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/interface/screens/pages/history_page.dart';
import 'package:app_with_apps/interface/screens/pages/news_page.dart';
import 'package:app_with_apps/interface/screens/pages/user_page.dart';

class PagesService {
  static List<Widget> get pages => [
        const NewsPage(),
        const HistoryPage(),
        const UserPage(),
      ];
}
