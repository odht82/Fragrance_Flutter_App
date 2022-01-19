// ignore_for_file: prefer_is_empty, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fragrance_app/models/cart_item.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";

  String? id;
  String? name;
  String? email;
  List<CartItemModel>? cart;

  UserModel({this.id, this.name, this.email, this.cart});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    email = snapshot[EMAIL];
    name = snapshot[NAME];
    cart = _convertCartItems(snapshot[CART] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFromDb) {
    List<CartItemModel> _result = [];
    if (cartFromDb.length > 0) {
      for (var element in cartFromDb) {
        _result.add(CartItemModel.fromMap(element));
      }
    }
    return _result;
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();
}


// 13467928