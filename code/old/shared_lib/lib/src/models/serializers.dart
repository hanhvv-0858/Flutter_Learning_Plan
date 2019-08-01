import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:shared_lib/src/models/weather.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Forecast,
  ForecastDay,
  Weather,
  TemperatureUnit,
  WeatherDescription,
  Product,
  ProductCategory,
  ImageTitle,
  Catalog,
  Cart,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
