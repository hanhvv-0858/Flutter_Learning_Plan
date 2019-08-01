// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<Cart> _$cartSerializer = new _$CartSerializer();

class _$CartSerializer implements StructuredSerializer<Cart> {
  @override
  final Iterable<Type> types = const [Cart, _$Cart];
  @override
  final String wireName = 'Cart';

  @override
  Iterable serialize(Serializers serializers, Cart object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'items',
      serializers.serialize(object.items,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
      'totalCost',
      serializers.serialize(object.totalCost,
          specifiedType: const FullType(double)),
      'totalCartItems',
      serializers.serialize(object.totalCartItems,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Cart deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap);
          break;
        case 'totalCost':
          result.totalCost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'totalCartItems':
          result.totalCartItems = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Cart extends Cart {
  @override
  final BuiltMap<String, int> items;
  @override
  final double totalCost;
  @override
  final int totalCartItems;

  factory _$Cart([void updates(CartBuilder b)]) =>
      (new CartBuilder()..update(updates)).build();

  _$Cart._({this.items, this.totalCost, this.totalCartItems}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('Cart', 'items');
    }
    if (totalCost == null) {
      throw new BuiltValueNullFieldError('Cart', 'totalCost');
    }
    if (totalCartItems == null) {
      throw new BuiltValueNullFieldError('Cart', 'totalCartItems');
    }
  }

  @override
  Cart rebuild(void updates(CartBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CartBuilder toBuilder() => new CartBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cart &&
        items == other.items &&
        totalCost == other.totalCost &&
        totalCartItems == other.totalCartItems;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, items.hashCode), totalCost.hashCode),
        totalCartItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cart')
          ..add('items', items)
          ..add('totalCost', totalCost)
          ..add('totalCartItems', totalCartItems))
        .toString();
  }
}

class CartBuilder implements Builder<Cart, CartBuilder> {
  _$Cart _$v;

  MapBuilder<String, int> _items;
  MapBuilder<String, int> get items =>
      _$this._items ??= new MapBuilder<String, int>();
  set items(MapBuilder<String, int> items) => _$this._items = items;

  double _totalCost;
  double get totalCost => _$this._totalCost;
  set totalCost(double totalCost) => _$this._totalCost = totalCost;

  int _totalCartItems;
  int get totalCartItems => _$this._totalCartItems;
  set totalCartItems(int totalCartItems) =>
      _$this._totalCartItems = totalCartItems;

  CartBuilder();

  CartBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _totalCost = _$v.totalCost;
      _totalCartItems = _$v.totalCartItems;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cart other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Cart;
  }

  @override
  void update(void updates(CartBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Cart build() {
    _$Cart _$result;
    try {
      _$result = _$v ??
          new _$Cart._(
              items: items.build(),
              totalCost: totalCost,
              totalCartItems: totalCartItems);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Cart', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
