import 'package:args/args.dart';

import '../configuration_command_builder.dart';

class HelpCommandConfig implements ConfigurationCommand {
  @override
  ArgParser config(ArgParser argParser) {
    var command = argParser..addOption('help', abbr: 'h');
    return command;
  }

  @override
  bool execute(ArgResults argResults) {
    if (argResults.options.contains('help')) {
      print('help');
      return true;
    }
    return false;
  }
}
