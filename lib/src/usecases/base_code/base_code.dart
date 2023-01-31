import '../../helper/extensions/file_extension.dart';
import 'dart:io';

class BaseCodeCreator {
  static List<String> get baseCodeTypes => [NormalBaseCode.type];
  static String get defaultBaseCodeType => NormalBaseCode.type;

  Future<void> create(String baseCodeType) async {
    final pubspec = File('pubspec.yaml');
    if (!pubspec.existsSync()) {
      stderr.write('not found pubspec.yaml file');
      exit(1);
    }
    var baseCode = BaseCode.factory(baseCodeType);
    await baseCode.execute();
  }
}

abstract class BaseCode {
  Future<void> _execute();
  Future<void> execute() async {
    try {
      await _execute();
    } catch (e) {
      print(e);
    }

    final metaData = File('basecode/.basecode');
    var listItems = await metaData.readAsLines();
    for (var item in listItems) {
      try {
        if (item.endsWith('/')) {
          var directory = Directory(item);
          await directory.deleteIfExists(recursive: true);
          await Directory('basecode/$item').rename(item);
        } else {
          var currentFile = File(item);
          if (currentFile.existsSync()) {
            await currentFile.delete();
          }
          var newFile = File('basecode/$item');
          File(item).create(recursive: true);
          await newFile.copy(item);
        }
      } catch (e) {
        print(e.toString());
      }
    }

    await Directory('basecode').delete(recursive: true);
  }

  factory BaseCode.factory(String baseCodeType) {
    if (baseCodeType == NormalBaseCode.type) return NormalBaseCode();
    throw Exception('unkown type of base code');
  }
  BaseCode();
}

class NormalBaseCode extends BaseCode {
  @override
  Future<void> _execute() async {
    await Process.run(
        'git', ['clone', 'https://github.com/htbao-dev/basecode.git']);
  }

  static String get type => 'normal';
}
