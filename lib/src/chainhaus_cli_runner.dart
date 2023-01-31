import 'package:args/command_runner.dart';
import 'package:chainhaus_flutter_cli/src/commands/base_code_command.dart';

class ChainhausFlutterCliRunner {
  void run(List<String> arguments) async {
    final runner = CommandRunner('chainhaus-flutter', 'A cli tool');
    runner.addCommand(BaseCodeCommand());
    try {
      await runner.run(arguments);
    } on UsageException catch (e) {
      print(e.message);
    } catch (e) {
      runner.printUsage();
    }
  }
}
