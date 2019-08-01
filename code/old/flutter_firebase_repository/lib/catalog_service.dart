/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_repository/deserialize_util.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:shared_lib/shared_lib.dart';

Serializers standardSerializers = serializers;

class FlutterCatalogService implements CatalogService {
  static const String firestorePath = 'catalog';

  final Firestore firestore;

  const FlutterCatalogService(this.firestore);

  CollectionReference _catalogRef() {
    return this.firestore.collection(firestorePath);
  }

  DocumentReference _productRef(String docId) {
    return this.firestore.document('$firestorePath/$docId');
  }

  /// We don't need to add an ID here, because when the product
  /// is passed back from Firestore to the stream, it'll
  /// add it's ID if it needs to.
  @override
  Future<DocumentReference> addNewProduct(Product product) {
    var json = standardSerializers.serialize(product);
    return _catalogRef().add(json);
  }

  @override
  Stream<List<Product>> streamProducts() {
    return _catalogRef().snapshots().map((QuerySnapshot s) {
      return s.documents.map((DocumentSnapshot doc) {
        return deserializeWithFirestoreId(doc, Product.serializer) as Product;
      }).toList();
    });
  }

  Stream<List<Product>> streamProductCategory(ProductCategory category) {
    return _catalogRef()
        .where("category", isEqualTo: category.toString())
        .snapshots()
        .map((QuerySnapshot s) {
      return s.documents.map((DocumentSnapshot doc) {
        return deserializeWithFirestoreId(doc, Product.serializer) as Product;
      }).toList();
    });
  }

  @override
  Future<void> updateProduct(Product product) {
    var json = standardSerializers.serialize(product);
    return _productRef(product.id).updateData(json);
  }
}
