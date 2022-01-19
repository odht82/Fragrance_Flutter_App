// ignore_for_file: avoid_function_literals_in_foreach_calls

// ignore: unused_import
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fragrance_app/constants/app_constants.dart';
import 'package:fragrance_app/constants/controllers.dart';
import 'package:fragrance_app/models/cart_item.dart';
import 'package:fragrance_app/models/product.dart';
import 'package:fragrance_app/models/user.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(ProductModel? product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product!.name} is already added");
      } else {
        String itemId = const Uuid().toString();
        userController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product!.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price
            }
          ])
        });
        Get.snackbar("Item added", "${product.name} was added to your cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      userController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      // debugPrint(e.message);
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart!.isNotEmpty) {
      userModel.cart!.forEach((cartItem) {
        // totalCartPrice.value += cartItem.cost;
      });
    }
  }

  bool _isItemAlreadyAdded(ProductModel? product) =>
      userController.userModel.value.cart!
          .where((item) => item.productId == product!.id)
          .isNotEmpty;

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      item.quantity! - 1;
      userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    logger.i({"quantity": item.quantity});
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
