import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:shared_lib/src/models/product.dart';

part 'catalog.g.dart';

abstract class Catalog implements Built<Catalog, CatalogBuilder> {
  BuiltList<Product> get availableProducts;

  Catalog._();

  factory Catalog([updates(CatalogBuilder b)]) = _$Catalog;
  static Serializer<Catalog> get serializer => _$catalogSerializer;
}
