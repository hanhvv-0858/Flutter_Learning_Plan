/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:shared_lib/e_commerce_app.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final CartService _service;

  // Inputs
  final _addProductController = new StreamController<AddToCartEvent>();
  void addToCart(Product product, int qty) {
    var productForCart = new Product((b) => b
      ..id = product.id
      ..title = product.title
      ..imageTitle = product.imageTitle
      ..category = product.category
      ..cost = product.cost);

    return _addProductController.sink
        .add(new AddToCartEvent(productForCart, qty));
  }

  final _removeFromCartController = new StreamController<RemoveFromCartEvent>();
  void removeFromCart(String productTitle, int qtyInCart) {
    return _removeFromCartController.sink.add(new RemoveFromCartEvent(productTitle, qtyInCart));
  }

  // Outputs
  Stream<Map<String, int>> get cartItems => _cartItemStreamController.stream;
  StreamController _cartItemStreamController =
      new BehaviorSubject<Map<String, int>>(seedValue: {});

  Stream<int> get cartItemCount => _cartItemCountStreamController.stream;
  StreamController _cartItemCountStreamController =
      new BehaviorSubject<int>(seedValue: 0);

  CartBloc(this._service) {
    _addProductController.stream.listen((_handleNewCartItems));
    _removeFromCartController.stream.listen((_handleRemoveCartItem));
    _service
        .streamCartCount()
        .listen((int count) => _cartItemCountStreamController.add(count));
    _service
        .streamCartItems()
        .listen((Map<String, int> data) => _cartItemStreamController.add(data));
  }

  void _handleNewCartItems(AddToCartEvent e) {
    _service.addToCart(e.product, e.qty);
  }

  void _handleRemoveCartItem(RemoveFromCartEvent e) {
    _service.removeFromCart(e.productTitle, e.qtyInCart);
  }

  close() {
    _addProductController.close();
    _removeFromCartController.close();
    _cartItemStreamController.close();
    _cartItemCountStreamController.close();
  }
}

class AddToCartEvent {
  final Product product;
  final int qty;

  AddToCartEvent(this.product, this.qty);
}

class RemoveFromCartEvent {
  final String productTitle;
  final int qtyInCart;

  RemoveFromCartEvent(this.productTitle, this.qtyInCart);
}
