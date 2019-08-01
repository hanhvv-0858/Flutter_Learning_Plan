import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:shared_lib/src/stores/e_commerce/app_store.dart';

abstract class CatalogService {
  Stream<List<Product>> streamProducts();
  Stream<List<Product>> streamProductCategory(ProductCategory category);
  Future<void> addNewProduct(Product product);
  Future<void> updateProduct(Product product);
}

/// Example implementation that *does not persist beyond the session*
class CatalogServiceTemporary implements CatalogService {
  final AppStore store;

  CatalogServiceTemporary(this.store);

  @override
  Future addNewProduct(Product product) async {
    var catalog = store.catalog.rebuild((CatalogBuilder b) {
      return b.availableProducts.update((ListBuilder<Product> productsBuilder) {
        return productsBuilder.add(product);
      });
    });
    store.catalog = catalog;
  }

  @override
  Stream<List<Product>> streamProductCategory(ProductCategory category) {
    return store.catalogNotifier.stream.map((snapshot) => store
        .catalog.availableProducts
        .where((Product p) => p.category == category)
        .toList());
  }

  @override
  Stream<List<Product>> streamProducts() {
    return store.catalogNotifier.stream.map((snapshot) {
      return store.catalog.availableProducts.asList();
    });
  }

  @override
  Future updateProduct(Product product) async {
    var orinalProduct = store.catalog.availableProducts
        .firstWhere((Product p) => p.title == product.title);
    var catalog = store.catalog.rebuild((CatalogBuilder b) {
      return b.availableProducts.update((ListBuilder<Product> productsBuilder) {
        productsBuilder.remove(orinalProduct);
        return productsBuilder.add(product);
      });
    });
    store.catalog = catalog;
  }
}
