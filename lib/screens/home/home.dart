import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:fragrance_app/constants/controllers.dart';
import 'package:fragrance_app/screens/home/widgets/products.dart';
import 'package:fragrance_app/screens/home/widgets/shopping_cart.dart';
import 'package:fragrance_app/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.deepOrange,
          ),
          title: const CustomText(
            text: "Fragrance store",
            size: 24,
            weight: FontWeight.bold,
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.deepOrange,
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: const Color(0xFF737373),
                      height: 580,
                      child: Container(
                        child: const ShoppingCartWidget(),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              Obx(
                () => UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.black26),
                  accountName: CustomText(
                    text: userController.userModel.value.name!.toUpperCase(),
                    size: 22,
                    weight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  accountEmail: CustomText(
                    text: userController.userModel.value.email!,
                    size: 18,
                    weight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const CustomText(
                  text: "Payments History",
                ),
                iconColor: Colors.deepOrange,
                onTap: () async {
                  // paymentsController.getPaymentHistory();
                },
              ),
              ListTile(
                onTap: () {
                  userController.signOut();
                },
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Log out"),
                iconColor: Colors.deepOrange,
              )
            ],
          ),
        ),
        body: Container(
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          child: const ProductsWidget(),
        ));
  }
}
