import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/economy/history_economy_page.dart';
import 'package:app_with_apps/interface/screens/common/pages/economy/news_economy_page.dart';
import 'package:app_with_apps/interface/screens/common/pages/todo/history_todo_page.dart';
import 'package:app_with_apps/interface/screens/common/pages/todo/news_todo_page.dart';
import 'package:app_with_apps/interface/screens/common/pages/user_page.dart';

class PagesService {
  static List<Widget> get pages_economy => [
        const NewsEconomyPage(),
        const HistoryEconomyPage(),
        const UserPage(),
      ];
  static List<Widget> get pages_todo => [
        const NewsToDoPage(),
        const HistoryToDoPage(),
        const UserPage(),
      ];
}
