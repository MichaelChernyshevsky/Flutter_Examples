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

  void goToCreate() => setState(() {
        print('+');
      });

  void nextSort() => setState(() {
        GetIt.I.get<AppProvider>().nextSort();
      });

  void prevSort() => setState(() {
        GetIt.I.get<AppProvider>().prevSort();
      });

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
                    widget: Row(
                      children: [
                        CustomButton(
                          color: UTILSConstants.purple,
                          text: AppLocalizations.current.back,
                          tap: prevSort,
                        ),
                        CustomContainer(
                          color: UTILSConstants.grey,
                          widget:
                              Text(GetIt.I.get<AppProvider>().getStateString),
                        ),
                        CustomButton(
                          color: UTILSConstants.purple,
                          text: AppLocalizations.current.go,
                          tap: nextSort,
                        ),
                      ],
                    ),
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






            import 'package:imaigination_mobile/constants/exports/pages_export.dart';

class Lable extends StatelessWidget {
  const Lable({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.blueGray900,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(8),
        ),
      ),
      padding: getPadding(all: 12),
      width: getHorizontalSize(343),
      child: Row(
        children: [
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: AppStyle.txtSoraLight14.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
