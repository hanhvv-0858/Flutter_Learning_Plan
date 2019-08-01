import 'dart:async';

import 'package:shared_lib/e_commerce_app.dart';
import 'package:shared_lib/src/stores/e_commerce/app_store.dart';

abstract class CartService {
  Stream<int> streamCartCount();
  Stream<Map<String, int>> streamCartItems();
  Future addToCart(Product p, int qty);
  Future<void> removeFromCart(String p, int qty);
}

/// Example implementation that *does not persist beyond the session*
class CartServiceTemporary implements CartService {
  final AppStore store;

  CartServiceTemporary(this.store);

  @override
  Future addToCart(Product p, int qty) async {
    var newTotalCount = store.cart.totalCartItems + qty;
    var newProductTotalCount = _currentCountForProduct(p) + qty;
    var updatedCart = store.cart.rebuild((CartBuilder builder) => builder
      ..totalCartItems = newTotalCount
      ..items.updateValue(
        p.title,
        (v) => v = newProductTotalCount,
        ifAbsent: () => newProductTotalCount,
      ));
    store.cart = updatedCart;
  }

  @override
  Future removeFromCart(String p, int qty) async {
    var newTotalCount = store.cart.totalCartItems - qty;
    var updatedCart = store.cart.rebuild((CartBuilder b) => b
      ..totalCartItems = newTotalCount
      ..items.remove(p));
    store.cart = updatedCart;
  }

  @override
  Stream<int> streamCartCount() {
    return store.cartNotifier.stream
        .map((snapshot) => store.cart.totalCartItems);
  }

  @override
  Stream<Map<String, int>> streamCartItems() {
    return store.cartNotifier.stream
        .map((dartData) => store.cart.items.asMap());
  }

  int _currentCountForProduct(Product p) {
    if (!store.cart.items.containsKey(p.title)) return 0;
    return store.cart.items[p.title];
  }
}
