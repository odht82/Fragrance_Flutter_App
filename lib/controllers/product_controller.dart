import 'dart:async';
import 'package:get/get.dart';
import 'package:fragrance_app/constants/firebase.dart';
import 'package:fragrance_app/models/product.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String productCollection = "products";

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(productCollection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
}
