import 'package:built_collection/built_collection.dart';
import 'package:shared_lib/src/e_commerce_models.dart';
import 'package:shared_lib/src/models/catalog.dart';
import 'package:shared_lib/src/utils/product_map.dart';
import 'dart:math' as math;

/// Search through the [categorizeProducts] Map and find the category
/// who's value list contains this product.
/// Not efficient, but fine considering the small dataset.
ProductCategory getCategoryForProduct(String productName) =>
    categorizeProducts.entries
        .firstWhere((MapEntry<ProductCategory, List<String>> entry) =>
            entry.value.contains(productName))
        .key;

/// Generate random cost for product roughly between 1 and 3 USD.
var _random = new math.Random();
double determineCost() {
  var cost = (_random.nextDouble() * 3.3).clamp(0.7, 3.3).toStringAsFixed(2);
  return double.parse(cost);
}

Product createProduct(String productName) {
  return new Product((b) => b
    ..title = productName
    ..imageTitle = availableProductsToImage[productName]
    ..category = getCategoryForProduct(productName)
    ..cost = determineCost());
}

Catalog populateCatalog() {
  ListBuilder<Product> catalog = ListBuilder();

  availableProductsToImage.forEach((String productName, ImageTitle imageTitle) {
    catalog.add(createProduct(productName));
  });

  return new Catalog((b) => b..availableProducts = catalog);
}

Cart buildInitialCart() {
  var items = new MapBuilder<String, int>();

  return new Cart((b) => b
    ..items = items
    ..totalCartItems = 0
    ..totalCost = 0.00);
}
