import 'package:app_with_apps/interface/exports/screens_exports.dart';

class AddSpedingScreen extends StatefulWidget {
  const AddSpedingScreen({super.key});

  @override
  State<AddSpedingScreen> createState() => _AddSpedingScreenState();
}

class _AddSpedingScreenState extends State<AddSpedingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addSpending() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.current.addSpending,
        ),
      ),
      body: Center(
        child: CustomButton(
          color: Colors.amber,
          tap: addSpending,
          text: AppLocalizations.current.add,
        ),
      ),
    );
  }
}
