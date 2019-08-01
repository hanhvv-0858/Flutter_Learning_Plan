/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_complete/app.dart';
import 'package:e_commerce_complete/blocs/app_bloc.dart';
import 'package:e_commerce_complete/blocs/cart_bloc.dart';
import 'package:e_commerce_complete/blocs/catalog_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_firebase_repository/catalog_service.dart';
import 'package:flutter_firebase_repository/cart_service.dart';
import 'package:flutter_firebase_repository/populate_firestore.dart';
import 'package:shared_lib/e_commerce_app.dart';

/// In this app, we initialize the Firestore, AppBloc, and ServiceProvider
/// right from the start, then inject them into the app.
Future<void> main() async {
  /// --------- BEGIN FIRESTORE REGION
  /// To use firebase as your store, uncomment this regeion
  /// Initialize the Firestore database.
  /// --------- UNCOMMENT STARTING HERE TO USE FIRESTORE
//  final FirebaseApp app = await FirebaseApp.configure(
//      name: 'e_commerce',
//      options: const FirebaseOptions(
//        googleAppID: '1:345740250303:ios:2eaba02db917f95a',
//        apiKey: 'AIzaSyDpY7dOXdtOM2O-tEa2fkubqqg8sh_aVjA',
//        projectID: 'flutter-in-action-3fa96',
//      ));
//  var firestore = new Firestore(app: app);
//  populateFirestore(firestore);
//  var catalogService = new FlutterCatalogService(firestore);
//  var cartService = new FlutterCartService(firestore);
  /// --------- UNCOMMENT ENDING HERE TO USE FIRESTORE
  /// --------- END FIRESTORE REGION

  /// --------- BEGIN LOCAL DEV REGION
  /// --------- UNCOMMENT STARTING HERE TO USE FIREBASE
  var store = new AppStore();
  var catalogService = new CatalogServiceTemporary(store);
  var cartService = new CartServiceTemporary(store);

  /// --------- UNCOMMENT ENDING HERE TO USE FIREBASE
  /// --------- END LOCAL DEV REGION

  /// Starting here, everything is used regardless of dependencies
  var blocProvider = new BlocProvider(
    cartBloc: new CartBloc(cartService),
    catalogBloc: new CatalogBloc(catalogService),
  );

  /// Wrap the app in the AppBloc
  /// An inherited widget which keeps track of
  /// the state of the app, including the
  /// active page, and acts as a Firestore provider throughout the app
  /// And
  /// Give AppBloc the ServiceProvider
  /// Then throughout the App you can access your Firestore Database by calling
  /// var _service = AppBloc.of(context).provider.catalogService
  runApp(
    AppBloc(
      blocProvider: blocProvider,
      child: ECommerceApp(),
    ),
  );
}
