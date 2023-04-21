import 'dart:convert';

import 'package:cueue/api/request/content/content_request.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/photo/photo_pickup_bottom_sheet_event.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:cueue/ui/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

SWRTriggerState<void, PhotoPickupBottomSheetEvent?> usePickupRecipeImage(WidgetRef ref, ValueNotifier<List<Content>> images, ValueNotifier<bool> isPosting) {
  final showErrorDialog = useShowErrorDialog(ref);
  final contentResponseMapper = ref.read(contentResponseMapperProvider);
  final createContentApi = ref.read(createContentApiProvider);
  final photoPickupBottomSheetDialog = usePhotoPickupBottomSheetDialog();
  final createContent = useSWRTrigger<File, Content>((file) async {
    final request = ContentRequest(data: base64Encode(file.readAsBytesSync()));
    final photoResponse = await createContentApi(request);
    return contentResponseMapper(photoResponse);
  });
  final pickupPhoto = useSWRTrigger<PhotoPickupBottomSheetEvent, File?>((event) async {
    final imagePicker = ImagePicker();
    final xfile = await event.when(
      fromCamera: () => imagePicker.pickImage(source: ImageSource.camera),
      fromLibrary: () => imagePicker.pickImage(source: ImageSource.gallery),
      cancel: () => null,
    );
    return (xfile != null) ? File(xfile.path) : null;
  });
  useEffectSWRData<Content>(createContent, (content) {
    images.value = List.from(images.value..add(content));
  });
  useEffectSWRIsMutating(createContent, (isMutating) {
    isPosting.value = isMutating;
  });
  useEffectSWRError(createContent, (error) {
    showErrorDialog.trigger(error);
  });
  useEffectSWRData<File?>(pickupPhoto, (file) {
    if (file != null) createContent.trigger(file);
  });
  useEffectSWRData<PhotoPickupBottomSheetEvent?>(photoPickupBottomSheetDialog, (event) {
    if (event != null) pickupPhoto.trigger(event);
  });
  return photoPickupBottomSheetDialog;
}
