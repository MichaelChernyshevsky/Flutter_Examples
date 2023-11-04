import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/models/enum/functions_enum.dart';

class AppProvider extends ChangeNotifier {
  bool loggined = true;
  Functions appIs = Functions.economy;

  void changeFunctions() {
    if (appIs == Functions.todo) {
      appIs = Functions.economy;
    } else {
      appIs = Functions.todo;
    }
  }
}
