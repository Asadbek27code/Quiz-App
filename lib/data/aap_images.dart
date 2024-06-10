import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@immutable
sealed class AppImages {
  const AppImages._();

  ///  SVG
  static final homeFlutter = SvgPicture.asset(
    'assets/images/flutter.svg',
    height: 75,
    width: 60.57,
    fit: BoxFit.cover,
  );

  static final homePython = SvgPicture.asset(
    'assets/images/phyton.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  static final homeFrontend = SvgPicture.asset(
    'assets/images/Frontend.svg',
    height: 49,
    width: 73,
    fit: BoxFit.cover,
  );

  static final homeJava = SvgPicture.asset(
    'assets/images/Java.svg',
    height: 74.98,
    width: 40.31,
    fit: BoxFit.cover,
  );

  static final homeCPlus = SvgPicture.asset(
    'assets/images/C++.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  static final homeCSharp = SvgPicture.asset(
    'assets/images/C#.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );
  static final homeAndroid = SvgPicture.asset(
    'assets/images/android.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );
  static final homeApple = SvgPicture.asset(
    'assets/images/apple.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  /// PNG
  static final pngExample = Image.asset(
    "",
    height: 40,
    width: 40,
    fit: BoxFit.cover,
  );
}
