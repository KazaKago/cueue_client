import 'package:flutter_easyloading/flutter_easyloading.dart';

void Function(String) useOverlayToast() {
  return (text) => EasyLoading.showSuccess(text, maskType: EasyLoadingMaskType.none);
}
