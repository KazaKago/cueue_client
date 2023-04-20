import 'dart:convert';

import 'package:cueue/api/request/content/content_request.dart';
import 'package:cueue/api/request/user/user_request.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_easy_loading.dart';
import 'package:cueue/hooks/global/utils/use_effect_hooks.dart';
import 'package:cueue/hooks/global/utils/use_handle_error.dart';
import 'package:cueue/hooks/hierarchy/mypage/use_firebase_user.dart';
import 'package:cueue/model/photo/photo_pickup_bottom_sheet_event.dart';
import 'package:cueue/model/user/user.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:cueue/ui/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_flowable/store_flowable.dart';
import 'package:universal_io/io.dart';

SWRTriggerState<void, PhotoPickupBottomSheetEvent?> useUpdateUserImage(WidgetRef ref, SWRState<String, User> userState) {
  final firebaseUserState = useFirebaseUser(ref);
  final createContentApi = ref.read(createContentApiProvider);
  final updateUserApi = ref.read(updateUserApiProvider);
  final contentResponseMapper = ref.read(contentResponseMapperProvider);
  final userResponseMapper = ref.read(userResponseMapperProvider);
  final photoPickupBottomSheetDialog = usePhotoPickupBottomSheetDialog();
  final showErrorDialog = useShowErrorDialog(ref);
  final easyLoading = useEasyLoading();
  final updateUser = useSWRTrigger<File, void>((file) async {
    final request = ContentRequest(data: base64Encode(file.readAsBytesSync()));
    final photoResponse = await createContentApi(request);
    final photoContent = contentResponseMapper(photoResponse);
    final newUser = userState.data?.copyWith(photo: photoContent);
    await userState.mutate(
      () async {
        final firebaseUser = firebaseUserState.data;
        if (firebaseUser != null) {
          final request = UserRequest(displayName: newUser?.displayName ?? '', photoKey: photoContent.key.value);
          final response = await updateUserApi(request);
          return userResponseMapper(firebaseUser, response);
        } else {
          throw const NoSuchElementException();
        }
      },
      optimisticData: newUser,
      revalidate: false,
    );
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
  useEffectSWRIsMutating(updateUser, (isMutating) {
    easyLoading.trigger(isMutating);
  });
  useEffectSWRError(updateUser, (error) {
    showErrorDialog.trigger(error);
  });
  useEffectSWRData<File?>(pickupPhoto, (file) {
    if (file != null) updateUser.trigger(file);
  });
  useEffectSWRData<PhotoPickupBottomSheetEvent?>(photoPickupBottomSheetDialog, (event) {
    if (event != null) pickupPhoto.trigger(event);
  });
  return photoPickupBottomSheetDialog;
}
