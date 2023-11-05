import 'package:app_with_apps/interface/exports/screens_exports.dart';

class HistoryEconomyPage extends StatefulWidget {
  const HistoryEconomyPage({super.key});

  @override
  State<HistoryEconomyPage> createState() => _HistoryEconomyPageState();
}

class _HistoryEconomyPageState extends State<HistoryEconomyPage> {
  Enum pageState = EconomySortState.all;

  final List<HistoryElement> initialList = [
    HistoryElement(title: 'title-1', count: 100),
    HistoryElement(title: 'title-2', count: 2),
  ];

  List<HistoryElement> elements = [
    HistoryElement(title: 'title-1', count: 100),
    HistoryElement(title: 'title-2', count: 2),
  ];

  void setNewState({required EconomySortState state}) {
    if (pageState != state) {
      setState(() => pageState = state);
    }

    if (pageState == EconomySortState.all) {
      elements = initialList;
    } else if (pageState == EconomySortState.byDate) {
      elements = initialList;
    } else if (pageState == EconomySortState.min) {
    } else if (pageState == EconomySortState.max) {}
  }

  Color getCurrentButtonColor({required EconomySortState state}) {
    if (state == pageState) {
      return UTILSConstants.purple;
    }
    return UTILSConstants.grey;
  }

  void goToCreate() => print('+');

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
                  DropdownButton(
                    value: GetIt.I.get<AppProvider>().sortIndex,
                    items: GetIt.I.get<AppProvider>().sortsElements,
                    onChanged: (value) => setState(() =>
                        GetIt.I.get<AppProvider>().setSortIndex(index: value)),
                  ),
                  CustomButton(
                    color: UTILSConstants.white,
                    text: AppLocalizations.current.add,
                    tap: goToCreate,
                  ),
                ],
              ),
              SizedBox(
                height: getVerticalSize(100),
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