import 'package:args/command_runner.dart';

import '../usecases/base_code/base_code.dart';

class BaseCodeCommand extends Command {
  BaseCodeCommand() {
    argParser.addOption(
      'type',
      abbr: 't',
      allowed: BaseCodeCreator.baseCodeTypes,
      defaultsTo: BaseCodeCreator.defaultBaseCodeType,
    );
  }

  @override
  String get description => 'Create base code';

  @override
  String get name => 'base-code';

  @override
  void run() {
    BaseCodeCreator().create(argResults?['type']);
  }
}
