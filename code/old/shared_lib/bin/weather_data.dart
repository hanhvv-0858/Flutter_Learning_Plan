import 'package:args/command_runner.dart';
import 'package:shared_lib/src/utils/cli_commands.dart';

void main(List<String> args) {
  CommandRunner("weather", "Flutter in Action Weather App CLI")
    ..addCommand(GenerateWeatherDataCommand())
    ..run(args);
}
