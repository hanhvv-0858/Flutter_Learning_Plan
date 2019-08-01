import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:built_value/serializer.dart';
import 'package:shared_lib/src/models/serializers.dart';
import 'package:shared_lib/src/models/weather_app_settings.dart';
import 'package:shared_lib/src/utils/generate_ecommerce_data.dart';
import 'package:shared_lib/src/utils/generate_weather_data.dart';

Serializers standardSerializers = serializers;

class GenerateWeatherDataCommand extends Command {
  GenerateWeatherDataCommand();

  @override
  String get description => 'Generate weather data JSON';

  @override
  String get name => 'data';

  Future run() async {
    var data = {};
    for (var city in allCities) {
      var helper = WeatherDataHelper();
      data[city] =
          standardSerializers.serialize(helper.generateTenDayForecast(city));
    }
    new File('lib/src/content/weather_data.json')
        .writeAsString(json.encode(data));
  }
}

class GenerateEcommerceData extends Command {
  @override
  String get description => "Generate ecommerce data JSON";

  @override
  String get name => "data";

  Future run() async {
    var data = standardSerializers.serialize(populateCatalog());

    new File('lib/src/content/ecommerce_data.json')
        .writeAsString(json.encode(data));
  }
}