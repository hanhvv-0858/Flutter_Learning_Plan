/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:image_picker/image_picker.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class NewProduct {
  double cost;
  String title;
  File image;
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey _formKey = new GlobalKey<FormState>();
  ProductCategory _selected;
  NewProduct _newProduct = new NewProduct();

  Widget get _image {
    return _newProduct?.image == null
        ? Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey,
            ))
        : Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: FileImage(_newProduct.image)),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              initialValue: "Product Title",
              validator: (String val) {
                if (val.isEmpty) {
                  return "Field cannot be left blank";
                }
              },
            ),
            TextFormField(
              initialValue: "Cost per unit",
              keyboardType: TextInputType.numberWithOptions(),
              validator: (String val) {
                if (double.tryParse(val) == null) {
                  return "Field must contain a valid number.";
                }
              },
            ),
            DropdownButtonFormField<ProductCategory>(
              value: _selected,
              hint: Text("Product Category"),
              onChanged: (ProductCategory newSelection) {
                setState(() => _selected = newSelection);
              },
              items: ProductCategory.values.map((ProductCategory category) {
                return DropdownMenuItem(
                    value: category, child: Text(category.toString()));
              }).toList(),
            ),
            GestureDetector(
              onTap: () async {
                File image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  _newProduct.image = image;
                });
              },
              child: _image,
            ),
          ],
        ),
      ),
    );
  }
}
