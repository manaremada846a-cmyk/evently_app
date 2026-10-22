// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Birthday.png
  AssetGenImage get birthday =>
      const AssetGenImage('assets/images/Birthday.png');

  /// File path: assets/images/Book Club.png
  AssetGenImage get bookClub =>
      const AssetGenImage('assets/images/Book Club.png');

  /// File path: assets/images/EVENTLY.png
  AssetGenImage get evently => const AssetGenImage('assets/images/EVENTLY.png');

  /// File path: assets/images/Exhibition.png
  AssetGenImage get exhibition =>
      const AssetGenImage('assets/images/Exhibition.png');

  /// File path: assets/images/Exhibitionimage.png
  AssetGenImage get exhibitionimage =>
      const AssetGenImage('assets/images/Exhibitionimage.png');

  /// File path: assets/images/Google.png
  AssetGenImage get google => const AssetGenImage('assets/images/Google.png');

  /// File path: assets/images/Group.svg
  String get group => 'assets/images/Group.svg';

  /// File path: assets/images/Meeting.png
  AssetGenImage get meeting => const AssetGenImage('assets/images/Meeting.png');

  /// File path: assets/images/Route log01.png
  AssetGenImage get routeLog01 =>
      const AssetGenImage('assets/images/Route log01.png');

  /// File path: assets/images/Route log02.png
  AssetGenImage get routeLog02 =>
      const AssetGenImage('assets/images/Route log02.png');

  /// File path: assets/images/Sport (2).png
  AssetGenImage get sport2 =>
      const AssetGenImage('assets/images/Sport (2).png');

  /// File path: assets/images/Sporttext.png
  AssetGenImage get sporttext =>
      const AssetGenImage('assets/images/Sporttext.png');

  /// File path: assets/images/Techie (1).png
  AssetGenImage get techie1 =>
      const AssetGenImage('assets/images/Techie (1).png');

  /// File path: assets/images/Techie.png
  AssetGenImage get techie => const AssetGenImage('assets/images/Techie.png');

  /// File path: assets/images/birthdayimag.png
  AssetGenImage get birthdayimag =>
      const AssetGenImage('assets/images/birthdayimag.png');

  /// File path: assets/images/bookclubimage.png
  AssetGenImage get bookclubimage =>
      const AssetGenImage('assets/images/bookclubimage.png');

  /// File path: assets/images/eye-slash.svg
  String get eyeSlash => 'assets/images/eye-slash.svg';

  /// File path: assets/images/lock.svg
  String get lock => 'assets/images/lock.svg';

  /// File path: assets/images/meetingimag.png
  AssetGenImage get meetingimag =>
      const AssetGenImage('assets/images/meetingimag.png');

  /// File path: assets/images/onbording1.png
  AssetGenImage get onbording1 =>
      const AssetGenImage('assets/images/onbording1.png');

  /// File path: assets/images/onbording2.png
  AssetGenImage get onbording2 =>
      const AssetGenImage('assets/images/onbording2.png');

  /// File path: assets/images/onbording3.png
  AssetGenImage get onbording3 =>
      const AssetGenImage('assets/images/onbording3.png');

  /// File path: assets/images/onbording4.png
  AssetGenImage get onbording4 =>
      const AssetGenImage('assets/images/onbording4.png');

  /// File path: assets/images/pageview2.png
  AssetGenImage get pageview2 =>
      const AssetGenImage('assets/images/pageview2.png');

  /// File path: assets/images/passowrdImage.png
  AssetGenImage get passowrdImage =>
      const AssetGenImage('assets/images/passowrdImage.png');

  /// File path: assets/images/profileRoute.png
  AssetGenImage get profileRoute =>
      const AssetGenImage('assets/images/profileRoute.png');

  /// File path: assets/images/routeimage.png
  AssetGenImage get routeimage =>
      const AssetGenImage('assets/images/routeimage.png');

  /// File path: assets/images/sms.svg
  String get sms => 'assets/images/sms.svg';

  /// File path: assets/images/splashImag2.png
  AssetGenImage get splashImag2 =>
      const AssetGenImage('assets/images/splashImag2.png');

  /// File path: assets/images/splashimg.svg
  String get splashimg => 'assets/images/splashimg.svg';

  /// File path: assets/images/sportboy.png
  AssetGenImage get sportboy =>
      const AssetGenImage('assets/images/sportboy.png');

  /// File path: assets/images/user.svg
  String get user => 'assets/images/user.svg';

  /// List of all assets
  List<dynamic> get values => [
    birthday,
    bookClub,
    evently,
    exhibition,
    exhibitionimage,
    google,
    group,
    meeting,
    routeLog01,
    routeLog02,
    sport2,
    sporttext,
    techie1,
    techie,
    birthdayimag,
    bookclubimage,
    eyeSlash,
    lock,
    meetingimag,
    onbording1,
    onbording2,
    onbording3,
    onbording4,
    pageview2,
    passowrdImage,
    profileRoute,
    routeimage,
    sms,
    splashImag2,
    splashimg,
    sportboy,
    user,
  ];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
