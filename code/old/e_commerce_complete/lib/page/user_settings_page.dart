/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';

class UserSettingsPage extends StatefulWidget {
  final ImageProvider<AssetImage> profileImage;
  UserSettingsPage({Key key, this.profileImage}) : super(key: key);

  @override
  UserSettingsPageState createState() {
    return new UserSettingsPageState();
  }
}

class UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    Widget avatar = CircleAvatar(
      backgroundImage: AssetImage("assets/images/apple-in-hand.jpg"),
      radius: 60.0,
    );

    final GlobalKey _formKey = new GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          avatar,
          TextFormField(
            initialValue: "Eric Windmill",
            validator: (value) {
              if (value.isEmpty) {
                return "Field cannot be left blank";
              }
            },
          ),
          TextFormField(
            initialValue: "eric@ericwindmill.com",
            validator: (value) {
              if (!value.contains("@")) {
                return "Please enter a valid email address.";
              }
            },
          ),
        ],
      ),
    );
  }
}
