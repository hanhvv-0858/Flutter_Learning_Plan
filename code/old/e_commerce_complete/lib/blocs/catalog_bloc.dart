/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:shared_lib/e_commerce_app.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_lib/shared_lib.dart';

class CatalogBloc {
  final CatalogService _service;

  // Output products
  Stream<List<Product>> get allProducts => _productStreamController.stream;
  StreamController _productStreamController =
      new BehaviorSubject<List<Product>>(
          seedValue: populateCatalog().availableProducts.asList());

  List<StreamController<List<Product>>> _controllersByCategory = [];
  List<Stream<List<Product>>> productStreamsByCategory = [];

  // Inputs
  final _productInputController =
      new StreamController<ProductEvent>.broadcast();
  Sink<ProductEvent> get addNewProduct => _productInputController.sink;
  Sink<ProductEvent> get updateProduct => _productInputController.sink;

  CatalogBloc(this._service) {
    _productInputController.stream
        .where((ProductEvent event) => event is UpdateProductEvent)
        .listen(_handleProductUpdate);
    _productInputController.stream
        .where((ProductEvent event) => event is AddProductEvent)
        .listen(_handleAddProduct);
    _service.streamProducts().listen((List<Product> data) {
      _productStreamController.add(data);
    });

    /// Category Streams
    /// create a new stream controller and stream for each category
    ProductCategory.values.forEach((ProductCategory category) {
      var _controller = new BehaviorSubject<List<Product>>();
      _service.streamProductCategory(category).listen((List<Product> data) {
        return _controller.add(data);
      });
      return _controllersByCategory.add(_controller);
    });

    _controllersByCategory
        .forEach((StreamController<List<Product>> controller) {
      productStreamsByCategory.add(controller.stream);
    });
  }

  _handleProductUpdate(ProductEvent event) {
    _service.addNewProduct(event.product);
  }

  _handleAddProduct(ProductEvent event) {
    _service.updateProduct(event.product);
  }

  void close() {
    _productStreamController.close();
    _productInputController.close();
    _controllersByCategory.forEach((controller) => controller.close());
  }
}

class ProductEvent {
  Product product;
}

class AddProductEvent extends ProductEvent {}

class UpdateProductEvent extends ProductEvent {}
