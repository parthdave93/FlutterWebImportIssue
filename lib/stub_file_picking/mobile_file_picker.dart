import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'platform_file_picker.dart';

PlatformFilePicker createPickerObject() => IOFilePicker();

class IOFilePicker implements PlatformFilePicker{
  @override
  String getFileName(file) {
      return file.path.substring(file.lastIndexOf(Platform.pathSeparator) + 1);
    }
  
    @override
    void startWebFilePicker(pickerCallBack) async {
    File file = await FilePicker.getFile();
    pickerCallBack([file.path]);
  }
}

