import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/swr/swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_create_user.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_display_name_editing_controller.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_pre_user.dart';
import 'package:cueue/hooks/hierarchy/welcome/use_update_pre_user_image.dart';
import 'package:cueue/model/photo/photo_pickup_bottom_sheet_event.dart';
import 'package:cueue/model/user/pre_user.dart';
import 'package:cueue/model/user/user.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:cueue/ui/global/widget/default_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserCreationPage extends HookConsumerWidget {
  const UserCreationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preUserState = usePreUser(ref);
    final pickupPreUserImage = useUpdatePreUserImage(ref, preUserState);
    final displayNameEditingController = useDisplayNameEditingController(preUserState);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: DefaultStateWidget<PreUser>(
          state: preUserState,
          child: (preUser) => _buildContent(ref, displayNameEditingController, preUser, pickupPreUserImage.trigger),
        ),
      ),
    );
  }

  Widget _buildContent(WidgetRef ref, TextEditingController displayNameEditingController, PreUser preUser, SWRTrigger<void, PhotoPickupBottomSheetEvent?> pickupProfileImage) {
    final intl = useIntl();
    final scrollController = useScrollController();
    final createUser = useCreateUser(ref);
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        padding: const EdgeInsets.all(32),
        controller: scrollController,
        children: <Widget>[
          Text(intl.welcomeToCueue, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.displaySmall),
          const SizedBox(height: 8),
          Text(intl.pleaseTellMeAboutYour, textAlign: TextAlign.center, style: Theme.of(useContext()).textTheme.titleMedium),
          const SizedBox(height: 48),
          _buildProfileImage(ref, preUser, pickupProfileImage),
          const SizedBox(height: 48),
          _buildNickname(displayNameEditingController),
          const SizedBox(height: 48),
          _buildSubmitButton(preUser, createUser.trigger),
          const SizedBox(height: 8),
          _buildYouCanChangeAfter(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProfileImage(WidgetRef ref, PreUser preUser, SWRTrigger<void, PhotoPickupBottomSheetEvent?> pickupProfileImage) {
    final intl = useIntl();
    final theme = useTheme();
    final photo = preUser.photo;
    if (photo != null) {
      return Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            GestureDetector(
              onTap: () => pickupProfileImage(null),
              child: SizedBox(
                width: 196,
                height: 196,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: CachedNetworkImageProvider(photo.url.toString()),
                ),
              ),
            ),
            FloatingActionButton.small(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () => pickupProfileImage(null),
              tooltip: intl.changePhoto,
              heroTag: intl.changePhoto,
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            GestureDetector(
              onTap: () => pickupProfileImage(null),
              child: SizedBox(
                width: 196,
                height: 196,
                child: CircleAvatar(
                  backgroundColor: theme.dividerColor,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Assets.images.icAppIcon.image(color: theme.hoverColor),
                  ),
                ),
              ),
            ),
            FloatingActionButton.small(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () => pickupProfileImage(null),
              tooltip: intl.changePhoto,
              heroTag: intl.changePhoto,
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildNickname(TextEditingController displayNameEditingController) {
    final intl = useIntl();
    return TextField(
      controller: displayNameEditingController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: intl.displayName, alignLabelWithHint: true, border: const OutlineInputBorder()),
    );
  }

  Widget _buildSubmitButton(PreUser preUser, SWRTrigger<PreUser, User> createUser) {
    final intl = useIntl();
    return ElevatedButton(
      onPressed: () => createUser(preUser),
      child: Text(intl.toNext),
    );
  }

  Widget _buildYouCanChangeAfter() {
    final intl = useIntl();
    return Text(textAlign: TextAlign.center, intl.youCanChangeAfter);
  }
}
