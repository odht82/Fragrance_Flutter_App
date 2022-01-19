import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fragrance_app/constants/asset_paths.dart';
import 'package:fragrance_app/controllers/appController.dart';
import 'package:fragrance_app/screens/authentication/widgets/bottom_text.dart';
import 'package:fragrance_app/screens/authentication/widgets/login.dart';
import 'package:fragrance_app/screens/authentication/widgets/registration.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 3),
                Image.asset(
                  logo,
                  width: 200,
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 5),
                Visibility(
                    visible: _appController.isLoginWidgetDisplayed.value,
                    child: const LoginWidget()),
                Visibility(
                    visible: !_appController.isLoginWidgetDisplayed.value,
                    child: const RegistrationWidget()),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _appController.isLoginWidgetDisplayed.value,
                  child: BottomTextWidget(
                    onTap: () {
                      _appController.changeDIsplayedAuthWidget();
                    },
                    text1: "Don't have an account?",
                    text2: "Create account!",
                  ),
                ),
                Visibility(
                  visible: !_appController.isLoginWidgetDisplayed.value,
                  child: BottomTextWidget(
                    onTap: () {
                      _appController.changeDIsplayedAuthWidget();
                    },
                    text1: "Already have an account?",
                    text2: "Sign in!!",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
