import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  File? _imageFile;
  Uint8List _webImage = Uint8List(8);

  File? get getImageFile => _imageFile;
  get getWebImage => _webImage;

  Future<void> pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _imagePicker = ImagePicker();
      XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selectedImage = File(image.path);

        selectedImage = _imageFile!;
        notifyListeners();
      } else {
        print('no image has been picked');
      }
    } else if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();

        _webImage = f;
      } else {
        print(' no image');
      }
    }
    notifyListeners();
  }
}
