import 'dart:io';

import 'package:args/args.dart';

abstract class ConfigurationCommand {
  ArgParser config(ArgParser argParser);
  bool execute(ArgResults argResults);
}

void couldNotFoundCommand() {
  stderr.writeln('Could not find command\n');
  stderr.writeln(
      '''Run 'chainhaus -h' (or 'chainhaus <command> -h') for available commands and options. ''');
}

class ConfigurationCommandBuilder {
  final ArgParser _argParser = ArgParser();
  final List<ConfigurationCommand> _executables = [];
  void run(List<String> arguments) {
    try {
      final res = _argParser.parse(arguments);

      if (res.command != null) {
        for (var executable in _executables) {
          var isExcuted = executable.execute(res);
          if (isExcuted) break;
        }
        exit(0);
      } else {
        couldNotFoundCommand();
        exit(1);
      }
    } on FormatException catch (e) {
      stderr.writeAll(
          <String>[e.message, 'usage: chainhaus [options...]', ''], '\n');
    }
  }

  ConfigurationCommandBuilder addConfiguration(
      ConfigurationCommand configCommand) {
    _executables.add(configCommand);
    configCommand.config(_argParser);
    return this;
  }
}
