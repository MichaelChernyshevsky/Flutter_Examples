import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';

class AppConstants {
  static List<Icon> get iconsBottomBar => [
        const Icon(Icons.newspaper),
        const Icon(Icons.history),
        const Icon(Icons.person),
      ];
  static List<String> get titlesBottomBar => [
        AppLocalizations.current.news,
        AppLocalizations.current.history,
        AppLocalizations.current.user,
      ];
}
