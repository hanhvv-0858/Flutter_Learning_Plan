/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_repository/catalog_service.dart';

// Add the Firestore ID as the Product's ID so that we can reference later.
dynamic deserializeWithFirestoreId(
    DocumentSnapshot doc, Serializer serializer) {
  var dataWithID;
  if (doc["id"] == null || doc["id"] == "") {
    dataWithID = new Map.from(doc.data)
      ..addEntries([
        new MapEntry("id", doc.documentID),
      ]);
  }
  return standardSerializers.deserializeWith(serializer, dataWithID);
}
