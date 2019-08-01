/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_repository/cart_service.dart';
import 'package:flutter_firebase_repository/catalog_service.dart';
import 'package:shared_lib/shared_lib.dart';

Serializers standardSerializers = serializers;

/// If this isn't the first time running the app,
/// This won't do anything
Future<void> populateFirestore(Firestore firestore) async {
  // initialize cart
  DocumentSnapshot userCart =
      await firestore.document("users/$mockFirebaseUserId").get();
  Cart cart = buildInitialCart();
  if (userCart["cart"] == null) {
    firestore
        .document("users/$mockFirebaseUserId")
        .setData({"cart": serializers.serialize(cart)});
  }

  // build catalog
  QuerySnapshot snapshot = await firestore.collection("catalog").getDocuments();
  if (snapshot.documents.isEmpty) {
    var catalogService = FlutterCatalogService(firestore);
    Catalog catalog = populateCatalog();

    try {
      // add cart collection to firebase and fill it
      catalog.availableProducts.forEach((e) {
        catalogService.addNewProduct(e);
      });
    } catch (e) {
      throw (e);
    }
    return null;
  }
}
