// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:file_picker_web/file_picker_web.dart';

import 'file_info.dart';

class FileUtils {
  static Future<FileInfo> picker() async {
    return await FilePicker.getFile().then((value) {
      FileReader reader = FileReader();
      final fileAttachmentFuture = reader.onLoadEnd.map((e) async {
        return FileInfo(value.name, content: reader.result);
      }).first;
      reader.readAsArrayBuffer(value);
      return fileAttachmentFuture;
    }).catchError((e) => throw e);
  }
}
