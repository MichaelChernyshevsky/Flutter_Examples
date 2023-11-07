import 'package:app_with_apps/core/models/enum/todo_sort_state.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class AppProvider extends ChangeNotifier {
  bool loggined = true;

  Functions appIs = Functions.economy;

  int get sortIndex => sortsIndex[appIs.index];

  List<int> sortsIndex = [0, 0];

  List<Enum> pagesStates = [
    EconomySortState.all,
    ToDoSortState.all,
  ];

  void nextSort() {
    if (appIs == Functions.economy) {
      if (sortIndex < kindsSorts[0].length - 1) {
        setSortIndex(index: sortIndex + 1);
      } else if (sortIndex == kindsSorts[0].length - 1) {
        setSortIndex(index: 0);
      }
    }
  }

  void prevSort() {
    if (appIs == Functions.economy) {
      if (sortIndex > 0) {
        setSortIndex(index: sortIndex + 1);
      } else if (sortIndex == 0) {
        setSortIndex(index: kindsSorts[0].length - 1);
      }
    }
  }

  void setSortIndex({required int index}) => sortsIndex[appIs.index] = index;

  String get getStateString => kindsSorts[appIs.index][sortIndex].toString();

  List<List<int>> kindsSorts = [
    [
      1,
      2,
      3,
    ],
    [
      4,
      5,
      6,
    ],
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

  Text get getAppBarTitle => Text(getTitle());

  String getTitle() {
    if (appIs == Functions.economy) {
      return AppLocalizations.current.economy;
    }
    return AppLocalizations.current.todo;
  }

  void changeFunctions() {
    if (appIs == Functions.todo) {
      appIs = Functions.economy;
    } else {
      appIs = Functions.todo;
    }
  }
}
