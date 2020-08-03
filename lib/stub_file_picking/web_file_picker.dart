import 'dart:html' as htmlfile;
import 'platform_file_picker.dart';

PlatformFilePicker createPickerObject() => WebFilePicker();

class WebFilePicker implements PlatformFilePicker{
  @override
  String getFileName(file) {
      return file.file.name;
    }
  
    @override
    void startWebFilePicker(pickerCallBack) {
    htmlfile.InputElement uploadInput = htmlfile.FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e){
      final files = uploadInput.files;
      //just checking for single file here you can for multiple files
      if(files.length == 1){
        final htmlfile.File file = files[0];
        final reader = htmlfile.FileReader();

        reader.onLoadEnd.listen((event) {
          pickerCallBack([FlutterWebFile(file, reader.result)]);
        });
        reader.readAsArrayBuffer(file);
      }
    });
  }

}


class FlutterWebFile{
  htmlfile.File file;
  List<int> fileBytes;

  FlutterWebFile(this.file, this.fileBytes);
}