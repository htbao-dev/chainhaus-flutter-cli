import 'dart:io';

extension DirectoryExtension on Directory {
  Future<void> deleteIfExists({bool recursive = false}) async {
    var isExists = await exists();
    if (isExists) {
      await delete(recursive: recursive);
    }
  }

  // Future<void> createIfNotExists() async {
  //   var isExists = await exists();
  //   if (!isExists){
  //     cop
  //   }
  // }
}
