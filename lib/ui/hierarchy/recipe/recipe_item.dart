import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/hooks/global/utils/use_date_format.dart';
import 'package:cueue/hooks/global/utils/use_theme.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RecipeItem extends HookWidget {
  const RecipeItem({
    required this.recipe,
    this.isCheck,
    this.onTap,
    super.key,
  });

  final RecipeSummary recipe;
  final bool? isCheck;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final intl = useIntl();
    final toDateString = useToDateString();
    final lastCookingAt = recipe.lastCookingAt;
    final date = (lastCookingAt != null) ? toDateString(lastCookingAt) : intl.notYetCooking;
    final title = recipe.title;
    final description = intl.lastCookingAt(date);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildImage(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(description, style: Theme.of(context).textTheme.bodySmall, maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            if (isCheck != null) Checkbox(value: isCheck, onChanged: (value) => onTap?.call()),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final theme = useTheme();
    final thumbnail = recipe.image?.url;
    if (thumbnail != null) {
      return CachedNetworkImage(
        imageUrl: thumbnail.toString(),
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        fadeInDuration: const Duration(milliseconds: 300),
      );
    } else {
      return Container(
        color: theme.dividerColor,
        width: 100,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Assets.images.icAppIcon.image(
            color: theme.hoverColor,
          ),
        ),
      );
    }
  }
}
