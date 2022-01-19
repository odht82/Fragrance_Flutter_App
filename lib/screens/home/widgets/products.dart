import 'package:flutter/material.dart';
import 'package:fragrance_app/constants/controllers.dart';
import 'package:fragrance_app/models/product.dart';
import 'package:fragrance_app/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(12),
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        children: producsController.products.map((ProductModel product) {
          return SingleProductWidget(
            product: product,
          );
        }).toList()));
  }
}
