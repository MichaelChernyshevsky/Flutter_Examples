import 'package:app_with_apps/core/models/class/sort_parametrs_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class HistoryEconomyPage extends StatefulWidget {
  const HistoryEconomyPage({super.key});

  @override
  State<HistoryEconomyPage> createState() => _HistoryEconomyPageState();
}

class _HistoryEconomyPageState extends State<HistoryEconomyPage> {
  // ignore: lines_longer_than_80_chars
  final List<SortParametrs> sortParametrs =
      GetIt.I.get<AppProvider>().sortParametrs;

  Enum pageState = EconomySortState.all;

  List<HistoryElement> elements = [];

  @override
  void initState() {
    setState(() {
      elements = [];
    });
    super.initState();
  }

  void setNewState({required EconomySortState state}) {
    if (pageState != state) {
      setState(() => pageState = state);
    }

    // if (pageState == EconomySortState.all) {
    //   elements = initialList;
    // } else if (pageState == EconomySortState.byDate) {
    //   elements = initialList;
    // } else if (pageState == EconomySortState.min) {
    // } else if (pageState == EconomySortState.max) {}
  }

  Color getCurrentButtonColor({required EconomySortState state}) {
    if (state == pageState) {
      return UTILSConstants.purple;
    }
    return UTILSConstants.grey;
  }

  void goToCreate() =>
      Navigator.of(context).pushNamed(AppRoutes.addSpendingScreen);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: getPadding(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CustomContainer(
                    color: UTILSConstants.black,
                    widget: const Row(),
                  ),
                  CustomButton(
                    color: UTILSConstants.white,
                    text: AppLocalizations.current.add,
                    tap: goToCreate,
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(100),
                child: ListView.builder(
                  itemCount: elements.length,
                  itemBuilder: (context, index) {
                    return Note(element: elements[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.all),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.all),
            //           text: AppLocalizations.current.sortAll,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.byDate),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.byDate),
            //           text: AppLocalizations.current.sortByDate,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.min),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.min),
            //           text: AppLocalizations.current.sortMin,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.max),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.max),
            //           text: AppLocalizations.current.sortMax,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),





