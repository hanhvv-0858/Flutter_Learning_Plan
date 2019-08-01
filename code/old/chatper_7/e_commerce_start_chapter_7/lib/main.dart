/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */


import 'package:e_commerce_start_chapter_7/app.dart';
import 'package:e_commerce_start_chapter_7/blocs/app_bloc.dart';
import 'package:e_commerce_start_chapter_7/blocs/cart_bloc.dart';
import 'package:e_commerce_start_chapter_7/blocs/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

/// In this app, I initialize dependencies and inject them into the app:
/// - datastore (either Firebase or local memory)
/// - services to talk to the data store
/// - the BLoC, which we inhject the services into.
///
/// The BLoCs don't care about which services they get, they only call out to them
/// So, you can easily switch between a local non-persistent data source and firebase
/// In the book, I'll focus on local storage, because it's removes the need for extra
/// libraries and set up. It is set up, however, to use Firebase if you feel inclined.
///
Future<void> main() async {
  /// --------- BEGIN FIRESTORE REGION
  ///
  /// Initialize the Firebase app.
  ///
  /// --------- UNCOMMENT STARTING HERE TO USE FIRESTORE
//  final FirebaseApp app = await FirebaseApp.configure(
//      name: 'e_commerce',
//      options: const FirebaseOptions(
//        googleAppID: '1:345740250303:ios:2eaba02db917f95a', //TODO eric: Replace
//        apiKey: 'AIzaSyDpY7dOXdtOM2O-tEa2fkubqqg8sh_aVjA',
//        projectID: 'flutter-in-action-3fa96',
//      ));
//
// // Pass the app into a new Firestore
//
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
  /// active page, and acts as a Bloc/Service provider throughout the app
  ///
  runApp(
    AppBloc(
      blocProvider: blocProvider,
      child: ECommerceApp(),
    ),
  );
}
