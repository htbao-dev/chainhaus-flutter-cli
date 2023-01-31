import 'dart:io';
import 'package:chainhaus/src/commands/help_command/help_command_config.dart';

import 'commands/configuration_command_builder.dart';
import 'commands/create_command/create_command_config.dart';

class ChainhausCliRunner {
  void run(List<String> arguments) {
    ConfigurationCommandBuilder()
        .addConfiguration(CreateCommandConfig())
        .addConfiguration(HelpCommandConfig())
        .run(arguments);
  }
}
