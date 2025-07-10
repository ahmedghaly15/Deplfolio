import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

final imagePickerProvider = Provider.autoDispose<ImagePicker>(
  (ref) => ImagePicker(),
);

final imagePickerNotifierProvider =
    StateNotifierProvider.autoDispose<ImagePickerNotifier, XFile?>(
      (ref) => ImagePickerNotifier(ref.read(imagePickerProvider)),
    );

class ImagePickerNotifier extends StateNotifier<XFile?> {
  final ImagePicker _imagePicker;

  ImagePickerNotifier(this._imagePicker) : super(null);

  Future<void> pickImage() async {
    final pickedCompressedImg = await _pickCompressedImg();
    if (pickedCompressedImg != null) {
      state = pickedCompressedImg;
    }
  }

  Future<XFile?> _pickCompressedImg() async {
    final pickedImg = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImg == null) return null;
    final compressedImg = await FlutterImageCompress.compressAndGetFile(
      pickedImg.path,
      '${pickedImg.path}_icon.png',
      format: CompressFormat.png,
      quality: 70,
    );
    return compressedImg;
  }
}
