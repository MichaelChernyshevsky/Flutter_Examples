import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/models/enum/functions_enum.dart';
import 'package:app_with_apps/core/models/enum/history_state.dart';
import 'package:app_with_apps/core/models/enum/todo_state.dart';
import 'package:app_with_apps/interface/screens/common/pages/service/pages_service.dart';

class AppProvider extends ChangeNotifier {
  bool loggined = true;

  Functions appIs = Functions.economy;

  List<Enum> pagesStates = [
    HistoryState.all,
    ToDoState.all,
  ];

  Enum get getState => getCurrentState();

  Enum getCurrentState() {
    if (appIs == Functions.economy) {
      return pagesStates[0];
    } else {
      return pagesStates[1];
    }
  }

  List<Widget> get pages => getPages();

  List<Widget> getPages() {
    if (appIs == Functions.economy) {
      return PagesService.pages_economy;
    }
    return PagesService.pages_todo;
  }

  void changeFunctions() {
    if (appIs == Functions.todo) {
      appIs = Functions.economy;
    } else {
      appIs = Functions.todo;
    }
  }
}
