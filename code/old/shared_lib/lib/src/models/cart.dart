import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cart.g.dart';

abstract class Cart implements Built<Cart, CartBuilder> {
  BuiltMap<String, int> get items;
  double get totalCost;
  int get totalCartItems;

  Cart._();

  factory Cart([updates(CartBuilder b)]) = _$Cart;
  static Serializer<Cart> get serializer => _$cartSerializer;
}
