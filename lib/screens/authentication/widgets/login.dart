// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fragrance_app/constants/controllers.dart';
import 'package:fragrance_app/widgets/custom_btn.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: userController.email,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        iconColor: Colors.deepOrange,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Email"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.symmetric(vertical: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: userController.password,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        iconColor: Colors.deepOrange,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Password"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: CustomButton(
                bgColor: Colors.deepOrange,
                text: "Login",
                onTap: () {
                  userController.signIn();
                }),
          )
        ],
      ),
    );
  }
}
