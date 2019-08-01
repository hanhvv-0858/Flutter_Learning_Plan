import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:shared_lib/src/utils/product_map.dart';
import 'package:shared_lib/src/utils/uuid.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  @nullable
  String get id;
  ImageTitle get imageTitle;
  String get title;
  @nullable
  ProductCategory get category;
  @nullable
  double get cost;

  Product._();

  factory Product([updates(ProductBuilder b)]) = _$Product;
  static Serializer<Product> get serializer => _$productSerializer;

  String get imageUrl => productImageFile[imageTitle];

  String get uniqueId => new Uuid().generateV4();
}

class ImageTitle extends EnumClass {
  static Serializer<ImageTitle> get serializer => _$imageTitleSerializer;
  const ImageTitle._(String name) : super(name);

  static const ImageTitle AppleInHand = _$AppleInHand;
  static const ImageTitle Apricots = _$Apricots;
  static const ImageTitle Asparagus = _$AsparagusImage;
  static const ImageTitle AvocadoHalf = _$AvocadoHalf;
  static const ImageTitle AvocadoTwoHalves = _$AvocadoTwoHalves;
  static const ImageTitle BlueberriesInHand = _$BlueberriesInHand;
  static const ImageTitle BlueberriesPile = _$BlueberriesPile;
  static const ImageTitle BroccoliPieces = _$BroccoliPieces;
  static const ImageTitle BrusselSprouts = _$BrusselSprouts;
  static const ImageTitle CacaoBeans = _$CacaoBeans;
  static const ImageTitle Carrots = _$Carrots;
  static const ImageTitle Chesnuts = _$Chesnuts;
  static const ImageTitle ChoppedVeggies = _$ChoppedVeggies;
  static const ImageTitle Cupcake = _$Cupcake;
  static const ImageTitle Eggs = _$Eggs;
  static const ImageTitle FrozenTreat = _$FrozenTreat;
  static const ImageTitle FruitStand = _$FruitStand;
  static const ImageTitle Lettuce = _$Lettuce;
  static const ImageTitle Lime = _$Lime;
  static const ImageTitle Milkshake = _$Milkshake;
  static const ImageTitle MilkshakeInHand = _$MilkshakeInHand;
  static const ImageTitle Nectarines = _$Nectarines;
  static const ImageTitle Oranges = _$Oranges;
  static const ImageTitle Papaya = _$Papaya;
  static const ImageTitle PopcicleInHand = _$PopcicleInHand;
  static const ImageTitle SlicedOranges = _$SlicedOranges;
  static const ImageTitle SpoonsFullOfSpices = _$SpoonsFullOfSpices;
  static const ImageTitle StrawberriesInHand = _$StrawberriesInHand;
  static const ImageTitle Walnuts = _$Walnut;

  static BuiltSet<ImageTitle> get values => _$imageTitleValues;
  static ImageTitle valueOf(String name) => _$valueOfImageTitle(name);
}

class ProductCategory extends EnumClass {
  static Serializer<ProductCategory> get serializer =>
      _$productCategorySerializer;
  const ProductCategory._(String name) : super(name);

  static const ProductCategory Veggies = _$Veggies;
  static const ProductCategory Fruit = _$Fruit;
  static const ProductCategory Treats = _$Treats;
  static const ProductCategory Nuts = _$Nuts;
  static const ProductCategory Protein = _$Protein;
  static const ProductCategory Cooking = _$Cooking;

  static BuiltSet<ProductCategory> get values => _$productCategoryValues;
  static ProductCategory valueOf(String name) => _$valueOfProductCategory(name);
}
