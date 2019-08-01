/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_start_chapter_7/page/base/page_base.dart';
import 'package:e_commerce_start_chapter_7/page/base/page_container.dart';
import 'package:e_commerce_start_chapter_7/utils/styles.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// All constants can be found in [utils/styles.dart]
    var _theme = ThemeData(
      /// content
      backgroundColor: AppColors.background,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.textColor,
            displayColor: AppColors.textColor,
          ),
      /// headings -- contrasts 'primary color'
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.displayTextColor,
            displayColor: AppColors.displayTextColor,
          ),
      /// ui -- contrasts 'accent color'
      accentTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.accentTextColor,
            displayColor: AppColors.accentTextColor,
          ),
      primaryColor: AppColors.primary,
      accentColor: AppColors.accent,
      primaryIconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: AppColors.displayTextColor),
      buttonColor: AppColors.primary[500],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: PageContainer(pageType: PageType.Catalog,),
      routes: {
        // TODO chapter_7: Setup named routes
      },
      navigatorObservers: [
        routeObserver
        // TODO chapter_7: Setup route observers
      ],
    );
  }
}

// create a route observer
final RouteObserver<Route> routeObserver = RouteObserver<Route>();