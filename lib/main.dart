import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fragrance_app/controllers/cart_controller.dart';
import 'package:fragrance_app/controllers/product_controller.dart';
import 'package:fragrance_app/screens/splash/splash.dart';

import 'constants/firebase.dart';
import 'controllers/appController.dart';
import 'controllers/authController.dart';
import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put<AppController>(AppController());
    Get.put<UserController>(UserController());
    Get.put<ProducsController>(ProducsController());
    Get.put<CartController>(CartController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fragrance Store',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}
