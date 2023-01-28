import 'package:flutter/material.dart';

class TitledCard extends StatelessWidget {
  const TitledCard({
    super.key,
    required this.child,
    this.title,
    this.margin,
    this.contentPadding,
  }) : children = null;

  const TitledCard.list({
    super.key,
    required this.children,
    this.title,
    this.margin,
    this.contentPadding,
  }) : child = null;

  final String? title;
  final Widget? child;
  final List<Widget>? children;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null) const SizedBox(height: 12),
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(title!, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
            ),
          if (child != null)
            Padding(
              padding: contentPadding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: child,
            ),
          if (children != null)
            Padding(
              padding: contentPadding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(children: children ?? []),
            ),
        ],
      ),
    );
  }
}
