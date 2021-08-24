import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({required this.imageUris, this.initialIndex = 0, final Key? key}) : super(key: key);

  final List<Uri> imageUris;
  final int initialIndex;

  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: imageUris.length,
      initialIndex: initialIndex,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: TabBarView(
          children: imageUris.map((imageUri) {
            return CachedNetworkImage(
              imageUrl: imageUri.toString(),
              width: double.infinity,
              fit: BoxFit.contain,
            );
          }).toList(),
        ),
      ),
    );
  }
}
