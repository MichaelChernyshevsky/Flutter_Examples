import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/interface/uikit/container.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      widget: Center(
        child: Text(text),
      ),
    );
  }
}
