import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/ui/hierarchy/photo/photo_page.dart';
import 'package:cueue/ui/hierarchy/photo/photo_pickup_bottom_sheet_dialog.dart';
import 'package:widgetbook/widgetbook.dart';

final photoComponent = WidgetbookComponent(
  name: 'Photo',
  useCases: [
    WidgetbookUseCase(
      name: 'PhotoPage',
      builder: (_) => PhotoPage(
        imageUris: [
          Uri.parse(Assets.images.time1Asa.path),
          Uri.parse(Assets.images.time2Hiru.path),
          Uri.parse(Assets.images.time3Yuu.path),
          Uri.parse(Assets.images.time4Yoru.path),
        ],
      ),
    ),
    const WidgetbookUseCase(
      name: 'PhotoPickupBottomSheetDialog',
      builder: PhotoPickupBottomSheetDialog.new,
    ),
  ],
);
