/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:shared_lib/shared_lib.dart';

Serializers standardSerializers = serializers;

final String mockFirebaseUserId = 'user_1';

class FlutterCartService implements CartService {
  static const String appStatePath = 'appState';

  final Firestore firestore;

  const FlutterCartService(this.firestore);

  DocumentReference _cartRef(String userId) {
    return this.firestore.document("users/$userId");
  }

  Future<int> _currentCartCount() async {
    var cartData = await _cartRef(mockFirebaseUserId)
        .get()
        .then((DocumentSnapshot s) => s.data["cart"]);
    if (cartData == null) return 0;
    return cartData["totalCartItems"];
  }

  Future<int> _currentCountForProduct(Product p) async {
    return _cartRef(mockFirebaseUserId).get().then((DocumentSnapshot s) {
      if (s.data["cart"] == null) return 0;
      if (s.data["cart"]["items"].containsKey(p.title)) {
        return s.data["cart"]["items"][p.title];
      }
      return 0;
    });
  }

  Future<Cart> _currentCart() {
    return _cartRef(mockFirebaseUserId).get().then((DocumentSnapshot doc) {
      var data = doc.data["cart"];
      if (data != null) {
        return standardSerializers.deserialize(data);
      }
    });
  }

  Stream<int> streamCartCount() {
    return _cartRef(mockFirebaseUserId).snapshots().map((DocumentSnapshot s) {
      return s.data["cart"]["totalCartItems"];
    });
  }

  // Update the _total_ cart items and the count of the
  // specific product
  Future<void> addToCart(Product p, int qty) async {
    var newTotalCount = await _currentCartCount() + qty;
    var newProductTotal = await _currentCountForProduct(p) + qty;
    Cart cart = await _currentCart();
    cart = cart.rebuild((CartBuilder b) => b
      ..totalCartItems = newTotalCount
      ..items.updateValue(
        p.title,
        (v) => v = newProductTotal,
        ifAbsent: () => newProductTotal,
      ));
    return _updateCart(cart);
  }

  Future<void> removeFromCart(String p, int qty) async {
    var cartItemTotal = await _currentCartCount();
    Cart cart = await _currentCart();
    cart = cart.rebuild((CartBuilder b) => b
      ..totalCartItems = cartItemTotal - qty
      ..items.remove(p));

    return _updateCart(cart);
  }

  Future<void> _updateCart(Cart cart) {
    var json = serializers.serialize(cart);
    return _cartRef(mockFirebaseUserId).setData({
      "cart": json,
    });
  }

  Stream<Map<String, int>> streamCartItems() {
    return _cartRef(mockFirebaseUserId).snapshots().map((DocumentSnapshot s) {
      var data = s.data["cart"]["items"];
      Map<String, int> entries = {};
      data.forEach((dynamic key, dynamic val) {
        entries[key] = val;
      });
      return entries;
    });
  }
}
