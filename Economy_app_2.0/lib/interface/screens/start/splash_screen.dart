import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/manager/get.it/app_provider.dart';
import 'package:app_with_apps/interface/routes/app_routes.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      _goToNext();
    });
    super.initState();
  }

  void _goToNext() {
    if (GetIt.I.get<AppProvider>().loggined) {
      Navigator.of(context).popAndPushNamed(AppRoutes.apps);
    } else {
      Navigator.of(context).popAndPushNamed(AppRoutes.signInScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text('Some'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(AppLocalizations.current.pressToContinue),
            ),
          ],
        ),
      ),
    );
  }
}
