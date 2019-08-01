import 'package:args/command_runner.dart';
import 'package:shared_lib/src/utils/cli_commands.dart';

void main(List<String> args) {
  CommandRunner("ecommerce", "Flutter in Action ECommerce App CLI")
    ..addCommand(GenerateEcommerceData())
    ..run(args);
}
