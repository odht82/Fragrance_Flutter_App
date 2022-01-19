import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:fragrance_app/constants/controllers.dart';
import 'package:fragrance_app/screens/home/widgets/cart_item_widget.dart';
import 'package:fragrance_app/widgets/custom_btn.dart';
import 'package:fragrance_app/widgets/custom_text.dart';

class ShoppingCartWidget extends StatelessWidget {
  const ShoppingCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CustomText(
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.only(bottom: 136),
                  child: Column(
                    children: userController.userModel.value.cart!
                        .map((cartItem) => CartItemWidget(
                              cartItem: cartItem,
                            ))
                        .toList(),
                  ),
                )),
          ],
        ),
        Positioned(
          bottom: 30,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(12),
            child: Obx(
              () => CustomButton(
                bgColor: Colors.deepOrange,
                text:
                    "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})",
                onTap: () {
                  // paymentsController.createPaymentMethod();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
