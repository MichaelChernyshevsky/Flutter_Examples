import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/models/class/historyelement_class.dart';
import 'package:app_with_apps/core/models/enum/history_state.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/core/utils/utils.dart';
import 'package:app_with_apps/interface/screens/widgets/custom_bottom.dart';
import 'package:app_with_apps/interface/screens/widgets/note_widget.dart';

class HistoryEconomyPage extends StatefulWidget {
  const HistoryEconomyPage({super.key});

  @override
  State<HistoryEconomyPage> createState() => _HistoryEconomyPageState();
}

class _HistoryEconomyPageState extends State<HistoryEconomyPage> {
  HistoryState pageState = HistoryState.all;

  final List<HistoryElement> initialList = [
    HistoryElement(title: 'title-1', count: 100),
    HistoryElement(title: 'title-2', count: 2),
  ];

  List<HistoryElement> elements = [
    HistoryElement(title: 'title-1', count: 100),
    HistoryElement(title: 'title-2', count: 2),
  ];

  void setNewState({required HistoryState state}) {
    if (pageState != state) {
      setState(() => pageState = state);
    }

    if (pageState == HistoryState.all) {
      elements = initialList;
    } else if (pageState == HistoryState.byDate) {
      elements = initialList;
    } else if (pageState == HistoryState.min) {
    } else if (pageState == HistoryState.max) {}
  }

  Color getCurrentButtonColor({required HistoryState state}) {
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