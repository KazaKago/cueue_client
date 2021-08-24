import 'package:cached_network_image/cached_network_image.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({required this.title, required this.description, required this.thumbnail, this.isCheck, this.onTap, final Key? key}) : super(key: key);

  final String title;
  final String description;
  final Uri? thumbnail;
  final bool? isCheck;
  final GestureTapCallback? onTap;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildImage(context),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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

  Widget _buildImage(final BuildContext context) {
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
        color: Theme.of(context).dividerColor,
        width: 100,
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
