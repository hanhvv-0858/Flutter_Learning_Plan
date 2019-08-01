/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_start_chapter_7/blocs/app_bloc.dart';
import 'package:e_commerce_start_chapter_7/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class AppBarCartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = AppBloc.of(context).blocProvider.cartBloc;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Stack(
        children: <Widget>[
          Container(
            child: CustomPaint(
              painter: AppBarIconBackground(),
            ),
          ),
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            color: AppColors.textColor,
            // buttons are disabled if `onPressed` is null
            onPressed: () {
              print("This navigation must be setup!");
              // TODO chapter_7: more push named
          },

          ),
          new Positioned(
            top: 4.0,
            right: 4.0,
            child: new Container(
              alignment: Alignment.center,
              width: 16.0,
              height: 16.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: StreamBuilder(
                initialData: 0,
                stream: _bloc.cartItemCount,
                builder: (BuildContext context, AsyncSnapshot snapshot) => Text(
                      snapshot.data.toString(),
                      style: new TextStyle(fontSize: 8.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarIconBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var _paintBrush = Paint()..color = Colors.white;
    var right = size.width;
    var shadowPath = Path();

    shadowPath.moveTo(right + 90, 40.0);
    shadowPath.lineTo(right + 10, 40.0);
    shadowPath.arcToPoint(new Offset(right + 20, 0.0),
        radius: Radius.circular(20.0));
    shadowPath.lineTo(right + 90, 0.0);
    shadowPath.close();

    // draw shadow underneath the figure
    canvas.drawShadow(shadowPath, Colors.black54, 3.0, false);

    var rightBase = new Rect.fromLTWH(right + 20, 0.0, 70.0, 40.0);
    canvas.drawRect(rightBase, _paintBrush);
    canvas.drawCircle(Offset(right + 18, 20.0), 20.0, _paintBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
