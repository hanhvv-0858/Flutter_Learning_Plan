/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_complete/blocs/cart_bloc.dart';
import 'package:e_commerce_complete/blocs/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class AppBloc extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;
  const AppBloc({
    Key key,
    @required this.child,
    @required this.blocProvider,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppBlocState();
  }

  static AppBlocState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppBlocContainer)
            as _AppBlocContainer)
        .appData;
  }
}

class AppBlocState extends State<AppBloc> {
  BlocProvider get blocProvider => widget.blocProvider;

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppBlocContainer(
      appData: this,
      blocProvider: widget.blocProvider,
      child: widget.child,
    );
  }
}

class _AppBlocContainer extends InheritedWidget {
  final AppBlocState appData;
  final BlocProvider blocProvider;

  _AppBlocContainer({
    Key key,
    @required this.appData,
    @required Widget child,
    @required this.blocProvider,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class RouteChangeEvent {
  final String route;

  RouteChangeEvent(this.route);
}

class ServiceProvider {
  final CatalogService catalogService;
  final CartService cartService;

  ServiceProvider({
    @required this.catalogService,
    @required this.cartService,
  });
}

class BlocProvider {
  CartBloc cartBloc;
  CatalogBloc catalogBloc;

  BlocProvider({@required this.cartBloc, @required this.catalogBloc});
}
