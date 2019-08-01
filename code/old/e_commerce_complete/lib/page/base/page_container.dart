/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_complete/menu/app_menu_drawer.dart';
import 'package:e_commerce_complete/page/add_product_form.dart';
import 'package:e_commerce_complete/page/base/page_background_image.dart';
import 'package:e_commerce_complete/page/base/page_base.dart';
import 'package:e_commerce_complete/page/cart_page.dart';
import 'package:e_commerce_complete/page/catalog_page.dart';
import 'package:e_commerce_complete/page/product_detail_page.dart';
import 'package:e_commerce_complete/page/user_settings_page.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class PageContainer extends PageContainerBase {
  final PageType pageType;

  PageContainer({Key key, @required this.pageType}) : super(key: key);
  @override
  Widget get menuDrawer => AppMenu();

  @override
  String get pageTitle {
    switch (pageType) {
      case PageType.Cart:
        return "My Cart";
      case PageType.Settings:
        return "My Settings";
        break;
      case PageType.AddProductForm:
        return "My Products";
      case PageType.Catalog:
      default:
        return "The Farmers Market";
    }
  }

  @override
  Widget get body {
    var page;
    switch (pageType) {
      case PageType.Cart:
        page = CartPage();
        break;
      case PageType.Settings:
        page = UserSettingsPage();
        break;
      case PageType.AddProductForm:
        page = AddProductForm();
        break;
      case PageType.Catalog:
      default:
        page = CatalogPage();
    }
    return Padding(
      padding: EdgeInsets.all(Spacing.matGridUnit()),
      child: page,
    );
  }

  @override
  Widget get background => Container();

  @override
  Color get backgroundColor => AppColors.background;
}

class ProductDetailPageContainer extends PageContainerBase {
  final Product product;

  ProductDetailPageContainer({@required this.product});

  @override
  Widget get body => ProductDetailPage(product: product);

  @override
  String get pageTitle => "";

  @override
  Widget get menuDrawer => null;

  @override
  Widget get background => BackgroundImage(
        key: PageStorageKey(product),
        imageTitle: _getImageForCategory,
      );

  ImageTitle get _getImageForCategory =>
      categoriesToImageMap[product.category.name];

  @override
  Color get backgroundColor => Colors.transparent;
}
