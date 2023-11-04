import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/interface/uikit/container.dart';

class DruwerApp extends StatefulWidget {
  const DruwerApp({
    super.key,
  });

  @override
  State<DruwerApp> createState() => _DruwerAppState();
}

class _DruwerAppState extends State<DruwerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text(AppLocalizations.current.curse)),
          CustomContainer(
            color: UTILSConstants.white,
            widget: const Row(
              children: [
                Text('data'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
