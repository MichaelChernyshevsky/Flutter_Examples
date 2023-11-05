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

  void setSortIndex({required int index}) => sortsIndex[appIs.index] = index;

  List<DropdownMenuItem> get sortsElements => kindsSorts[appIs.index];

  List<List<DropdownMenuItem>> kindsSorts = [
    [
      DropdownMenuItem(
        value: 0,
        child: Text(AppLocalizations.current.sortAll),
      ),
      DropdownMenuItem(
        value: 1,
        child: Text(AppLocalizations.current.sortByDate),
      ),
      DropdownMenuItem(
        value: 2,
        child: Text(AppLocalizations.current.sortMin),
      ),
      DropdownMenuItem(
        value: 3,
        child: Text(AppLocalizations.current.sortMax),
      ),
    ],
    [
      DropdownMenuItem(
        value: AppLocalizations.current.sortAll,
        child: Text(AppLocalizations.current.sortAll),
      ),
      DropdownMenuItem(
        value: AppLocalizations.current.sortByDate,
        child: Text(AppLocalizations.current.sortByDate),
      ),
      DropdownMenuItem(
        value: AppLocalizations.current.sortMax,
        child: Text(AppLocalizations.current.sortMin),
      ),
      DropdownMenuItem(
        value: AppLocalizations.current.sortMax,
        child: Text(AppLocalizations.current.sortMax),
      ),
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
