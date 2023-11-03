import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/utils/enum/text_enum.dart';
import 'package:app_with_apps/interface/routes/app_routes.dart';
import 'package:app_with_apps/core/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/core/utils/utils.dart';
import 'package:app_with_apps/interface/screens/widgets/custom_bottom.dart';
import 'package:app_with_apps/interface/uikit/text.dart';
import 'package:app_with_apps/interface/uikit/textField.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<Object?> goToSignUp() =>
      Navigator.of(context).pushNamed(AppRoutes.singUpSCreen);

  void signIn() => print(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextField(
                controller: email,
                padding: getPadding(top: 23, bottom: 15, left: 40, right: 40),
              ),
              CustomTextField(
                controller: password,
                padding: getPadding(left: 40, right: 40),
              ),
              CustomButton(
                padding: getPadding(left: 100, right: 100, top: 40, bottom: 90),
                text: AppLocalizations.current.signIn,
                color: Colors.purple,
                tap: signIn,
              ),
              Padding(
                padding: getPadding(bottom: 25),
                child: GestureDetector(
                  onTap: goToSignUp,
                  child: CustomText(
                    text: AppLocalizations.current.signUp,
                    fontSize: TextEnum.bottom,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
