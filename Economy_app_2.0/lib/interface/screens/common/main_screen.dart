import 'package:app_with_apps/core/constants/app_constants.dart';
import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/interface/screens/common/pages/service/pages_service.dart';
import 'package:app_with_apps/interface/screens/widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.current.appName)),
      drawer: const DruwerApp(),
      body: Stack(
        children: [
          PagesService.pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppConstants.iconsBottomBar[0],
            label: AppConstants.titlesBottomBar[0],
          ),
          BottomNavigationBarItem(
            icon: AppConstants.iconsBottomBar[1],
            label: AppConstants.titlesBottomBar[1],
          ),
          BottomNavigationBarItem(
            icon: AppConstants.iconsBottomBar[2],
            label: AppConstants.titlesBottomBar[2],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: changePage,
      ),
    );
  }

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
