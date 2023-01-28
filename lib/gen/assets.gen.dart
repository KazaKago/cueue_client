/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/dotenv.production
  String get dotenvProduction => 'assets/env/dotenv.production';

  /// File path: assets/env/dotenv.staging
  String get dotenvStaging => 'assets/env/dotenv.staging';

  /// List of all assets
  List<String> get values => [dotenvProduction, dotenvStaging];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_app_icon.png
  AssetGenImage get icAppIcon => const AssetGenImage('assets/images/ic_app_icon.png');

  /// File path: assets/images/time1_asa.png
  AssetGenImage get time1Asa => const AssetGenImage('assets/images/time1_asa.png');

  /// File path: assets/images/time2_hiru.png
  AssetGenImage get time2Hiru => const AssetGenImage('assets/images/time2_hiru.png');

  /// File path: assets/images/time3_yuu.png
  AssetGenImage get time3Yuu => const AssetGenImage('assets/images/time3_yuu.png');

  /// File path: assets/images/time4_yoru.png
  AssetGenImage get time4Yoru => const AssetGenImage('assets/images/time4_yoru.png');

  /// List of all assets
  List<AssetGenImage> get values => [icAppIcon, time1Asa, time2Hiru, time3Yuu, time4Yoru];
}

class Assets {
  Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
