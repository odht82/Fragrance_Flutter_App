import 'package:flutter/material.dart';
import 'package:fragrance_app/constants/controllers.dart';
import 'package:fragrance_app/models/product.dart';
import 'package:fragrance_app/widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel? product;
  const SingleProductWidget({Key? key, this.product}) : super(key: key);

  static const kTextColor = Color(0xFF535353);
  static const kTextLightColor = Color(0xFFACACAC);
  static const kDefaultPaddin = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(children: [
                  Ink.image(
                    image: NetworkImage(product!.image!),
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: product!.name,
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                    CustomText(
                      text: product!.brand,
                      size: 16,
                      color: Colors.black87,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "\$${product!.price}",
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                        IconButton(
                            icon: const Icon(Icons.add_shopping_cart),
                            color: Colors.deepOrange,
                            onPressed: () {
                              cartController.addProductToCart(product);
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
