import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSpedingScreen extends StatefulWidget {
  const AddSpedingScreen({super.key});

  static Widget builder(BuildContext context) {
    return const AddSpedingScreen();
  }

  @override
  State<AddSpedingScreen> createState() => _AddSpedingScreenState();
}

class _AddSpedingScreenState extends State<AddSpedingScreen> {
  EconomyBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    super.initState();
  }

  void addSpending() => bloc!.add(AddSpending(title: 'title'));
  // Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.current.addSpending,
        ),
      ),
      body: BlocListener<EconomyBloc, EconomyBlocState>(
        listener: (context, state) {
          if (state is BlocError) {
            debugPrint('error adding');
          } else if (state is BlocSuccess) {
            Navigator.of(context).pop('success');
          }
        },
        child: Center(
          child: CustomButton(
            color: Colors.amber,
            tap: addSpending,
            text: AppLocalizations.current.add,
          ),
        ),
      ),
    );
  }
}
