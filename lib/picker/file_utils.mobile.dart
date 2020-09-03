import 'package:file_picker/file_picker.dart';

import 'file_info.dart';

class FileUtils {
  static Future<FileInfo> picker() async {
    return FilePicker.getFile().then((value) {
      final name = value.path.split('/').last;
      return FileInfo(name, path: value.path);
    }).catchError((e) => throw e);
  }
}
