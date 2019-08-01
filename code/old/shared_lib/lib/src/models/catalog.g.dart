// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

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

Serializer<Catalog> _$catalogSerializer = new _$CatalogSerializer();

class _$CatalogSerializer implements StructuredSerializer<Catalog> {
  @override
  final Iterable<Type> types = const [Catalog, _$Catalog];
  @override
  final String wireName = 'Catalog';

  @override
  Iterable serialize(Serializers serializers, Catalog object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'availableProducts',
      serializers.serialize(object.availableProducts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Product)])),
    ];

    return result;
  }

  @override
  Catalog deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatalogBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'availableProducts':
          result.availableProducts.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Product)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Catalog extends Catalog {
  @override
  final BuiltList<Product> availableProducts;

  factory _$Catalog([void updates(CatalogBuilder b)]) =>
      (new CatalogBuilder()..update(updates)).build();

  _$Catalog._({this.availableProducts}) : super._() {
    if (availableProducts == null) {
      throw new BuiltValueNullFieldError('Catalog', 'availableProducts');
    }
  }

  @override
  Catalog rebuild(void updates(CatalogBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogBuilder toBuilder() => new CatalogBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Catalog && availableProducts == other.availableProducts;
  }

  @override
  int get hashCode {
    return $jf($jc(0, availableProducts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Catalog')
          ..add('availableProducts', availableProducts))
        .toString();
  }
}

class CatalogBuilder implements Builder<Catalog, CatalogBuilder> {
  _$Catalog _$v;

  ListBuilder<Product> _availableProducts;
  ListBuilder<Product> get availableProducts =>
      _$this._availableProducts ??= new ListBuilder<Product>();
  set availableProducts(ListBuilder<Product> availableProducts) =>
      _$this._availableProducts = availableProducts;

  CatalogBuilder();

  CatalogBuilder get _$this {
    if (_$v != null) {
      _availableProducts = _$v.availableProducts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Catalog other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Catalog;
  }

  @override
  void update(void updates(CatalogBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Catalog build() {
    _$Catalog _$result;
    try {
      _$result =
          _$v ?? new _$Catalog._(availableProducts: availableProducts.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'availableProducts';
        availableProducts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Catalog', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
