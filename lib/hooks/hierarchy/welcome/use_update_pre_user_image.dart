import 'dart:convert';

import 'package:cueue/api/request/content/content_request.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/model/photo/photo_pickup_bottom_sheet_event.dart';
import 'package:cueue/model/user/pre_user.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:cueue/ui/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

SWRTriggerState<void, PhotoPickupBottomSheetEvent?> useUpdatePreUserImage(WidgetRef ref, SWRState<String, PreUser> preUserState) {
  final createContentApi = ref.read(createContentApiProvider);
  final contentResponseMapper = ref.read(contentResponseMapperProvider);
  final photoPickupBottomSheetDialog = usePhotoPickupBottomSheetDialog();
  final showErrorDialog = useShowErrorDialog(ref);
  final easyLoading = useEasyLoading();
  final updatePreUser = useSWRTrigger<File, void>((file) async {
    final request = ContentRequest(data: base64Encode(file.readAsBytesSync()));
    final photoResponse = await createContentApi(request);
    final photoContent = contentResponseMapper(photoResponse);
    final newPreUser = preUserState.data?.copyWith(photo: photoContent);
    await preUserState.mutate(null, optimisticData: newPreUser, revalidate: false);
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
  useEffectSWRIsMutating(updatePreUser, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(updatePreUser, (error) {
    showErrorDialog.trigger(error);
  });
  useEffectSWRData<PhotoPickupBottomSheetEvent, File?>(pickupPhoto, (file) {
    if (file != null) updatePreUser.trigger(file);
  });
  useEffectSWRData<void, PhotoPickupBottomSheetEvent?>(photoPickupBottomSheetDialog, (event) {
    if (event != null) pickupPhoto.trigger(event);
  });
  return photoPickupBottomSheetDialog;
}
