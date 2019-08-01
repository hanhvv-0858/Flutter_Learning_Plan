/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_start_chapter_7/blocs/app_bloc.dart';
import 'package:e_commerce_start_chapter_7/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key key, this.product}) : super(key: key);

  @override
  ProductDetailPageState createState() {
    return new ProductDetailPageState();
  }
}

class ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    var _cartBloc = AppBloc.of(context).blocProvider.cartBloc;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 100.0,
          left: 30.0, // half of the "padding" we added in the containers width
          child: Container(
            padding: EdgeInsets.all(Spacing.matGridUnit(scale: 3)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1.0),
                ]),
            width: MediaQuery.of(context).size.width - 60.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.product.title,
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(color: AppColors.displayTextColor),
                        ),
                        Text(
                          widget.product.category.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "\$ ${widget.product.cost} / lb",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: AppColors.displayTextColor),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Spacing.matGridUnit(scale: 2)),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Hero(
                          tag: widget.product.uniqueId,
                          child: Image.asset(widget.product.imageUrl),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              "This is a nice ${widget.product.title} thing you can buy and eat to grow strong."),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        if (_quantity > 0) {
                          setState(() => _quantity--);
                        }
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      _quantity.toString(),
                      style: Theme.of(context).primaryTextTheme.headline,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => _quantity++);
                      },
                      icon: Icon(Icons.add),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      onPressed: () {
                        _cartBloc.addToCart(widget.product, _quantity);
                        // TODO chapter_7: Pop on add to cart!
//                        return Navigator.pop(context);
                      },
                      textColor: Colors.white,
                      child: Text("Add to Cart"),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
