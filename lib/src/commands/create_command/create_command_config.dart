import 'package:args/args.dart';

import '../configuration_command_builder.dart';

class CreateCommandConfig implements ConfigurationCommand {
  @override
  ArgParser config(ArgParser argParser) {
    var command = argParser.addCommand('create');
    command.addCommand('base-code');
    return command;
  }

  @override
  bool execute(ArgResults argResults) {
    if (argResults.command?.name == 'create') {
      print('create');
      return true;
    }
    return false;
  }
}
