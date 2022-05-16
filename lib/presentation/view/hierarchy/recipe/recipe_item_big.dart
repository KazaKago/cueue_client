import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class RecipeItemBig extends StatelessWidget {
  const RecipeItemBig({
    required this.title,
    required this.description,
    required this.thumbnail,
    this.isCheck,
    this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final Uri? thumbnail;
  final bool? isCheck;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: _buildImage(context),
                  ),
                  const SizedBox(height: 8),
                  Text(title, style: Theme.of(context).textTheme.subtitle1, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(description, style: Theme.of(context).textTheme.caption, maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            if (isCheck != null) Checkbox(value: isCheck, onChanged: (value) => onTap?.call()),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (thumbnail != null) {
      return AspectRatio(
        aspectRatio: 3 / 2,
        child: CachedNetworkImage(
          imageUrl: thumbnail.toString(),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 100,
          fadeInDuration: const Duration(milliseconds: 300),
        ),
      );
    } else {
      return Container(
        color: Theme.of(context).dividerColor,
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Assets.images.icAppIcon.image(
            color: Theme.of(context).hoverColor,
          ),
        ),
      );
    }
  }
}
