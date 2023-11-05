import 'package:app_with_apps/interface/exports/screens_exports.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.text,
    required this.tap,
    this.width,
    this.height = 40,
    this.padding,
  });

  final double? width;
  final double height;
  final Color color;
  final String text;
  final EdgeInsetsGeometry? padding;
  final VoidCallback tap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? getPadding(all: 0),
      child: GestureDetector(
        onTap: () {
          widget.tap();
        },
        child: CustomContainer(
          color: widget.color,
          height: widget.height,
          width: widget.width,
          widget: Center(
            child: CustomText(text: widget.text),
          ),
        ),
      ),
    );
  }
}
