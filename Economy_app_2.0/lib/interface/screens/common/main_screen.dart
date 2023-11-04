import 'package:app_with_apps/core/constants/app_constants.dart';
import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/manager/get.it/app_provider.dart';
import 'package:app_with_apps/core/models/enum/functions_enum.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/core/utils/utils.dart';
import 'package:app_with_apps/interface/screens/common/pages/service/pages_service.dart';
import 'package:get_it/get_it.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late List<Widget> _history;

  @override
  void initState() {
    getPagesList();
    super.initState();
  }

  void changeFunctions() => setState(() {
        GetIt.I.get<AppProvider>().changeFunctions();
        getPagesList();
      });

  void changePage(int index) => setState(
        () => _selectedIndex = index,
      );

  void getPagesList() => setState(
        () => _history = GetIt.I.get<AppProvider>().appIs == Functions.economy
            ? PagesService.pages_economy
            : PagesService.pages_todo,
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.current.appName),
        actions: [
          Padding(
            padding: getPadding(right: 20),
            child: GestureDetector(
              onTap: changeFunctions,
              child: Icon(
                Icons.change_circle_outlined,
                color: UTILSConstants.purple,
              ),
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          _history[_selectedIndex],
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: UTILSConstants.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(.15),
          //     blurRadius: 30,
          //     offset: const Offset(0, 10),
          //   ),
          // ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: AppConstants.iconsBottomBar.length,
          scrollDirection: Axis.horizontal,
          padding: getPadding(left: 50, right: 50),
          itemBuilder: (context, index) => InkWell(
            onTap: () => changePage(index),
            splashColor: UTILSConstants.transparent,
            highlightColor: UTILSConstants.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == _selectedIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == _selectedIndex ? size.width * .014 : 0,
                  decoration: BoxDecoration(
                    color: UTILSConstants.purple,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  AppConstants.iconsBottomBar[index],
                  size: size.width * .076,
                  color: index == _selectedIndex
                      ? UTILSConstants.purple
                      : UTILSConstants.grey,
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: AppConstants.iconsBottomBar[0],
      //       label: AppConstants.titlesBottomBar[0],
      //     ),
      //     BottomNavigationBarItem(
      //       icon: AppConstants.iconsBottomBar[1],
      //       label: AppConstants.titlesBottomBar[1],
      //     ),
      //     BottomNavigationBarItem(
      //       icon: AppConstants.iconsBottomBar[2],
      //       label: AppConstants.titlesBottomBar[2],
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.purple,
      //   onTap: changePage,
      // ),
    );
  }
}
