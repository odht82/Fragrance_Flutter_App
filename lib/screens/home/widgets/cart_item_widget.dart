// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:fragrance_app/constants/controllers.dart';
import 'package:fragrance_app/models/cart_item.dart';
import 'package:fragrance_app/widgets/custom_text.dart';
import 'package:get/get.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel? cartItem;

  const CartItemWidget({Key? key, this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem!.image!,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 14),
                child: CustomText(
                  text: cartItem!.name,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      cartController.decreaseQuantity(cartItem!);
                      Get.snackbar("Quantity decreased", "${cartItem!.name!}");
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: cartItem!.quantity.toString(),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      cartController.increaseQuantity(cartItem!);
                      Get.snackbar("Quantity increased", "${cartItem!.name!}");
                    }),
              ],
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${cartItem!.cost}",
            size: 20,
            weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
