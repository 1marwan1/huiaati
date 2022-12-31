// ignore: constant_identifier_names
enum TypeImage {
  // ignore: constant_identifier_names
  ICON_IMAGE,
  // ignore: constant_identifier_names
  SPLASH_IMAGE,
  // ignore: constant_identifier_names
  SPLASH_SOILD_IMAGE,
  // ignore: constant_identifier_names
  LOGE_IMAGE,
  // ignore: constant_identifier_names
  LOGETEXT_IMAGE,
  // ignore: constant_identifier_names
  PATTERN_IMAGE,
  // ignore: constant_identifier_names
  PATTERN_WHITE_IMAGE
}

extension TypeImageX on TypeImage {
  String value() {
    switch (this) {
      case TypeImage.ICON_IMAGE:
        return "assets/images/icon.png";
      case TypeImage.LOGE_IMAGE:
        return "assets/images/loge.png";
      case TypeImage.LOGETEXT_IMAGE:
        return "assets/images/logetext.png";
      case TypeImage.PATTERN_IMAGE:
        return "assets/images/pattern.png";
      case TypeImage.PATTERN_WHITE_IMAGE:
        return "assets/images/pattern2.png";
      case TypeImage.SPLASH_IMAGE:
        return "assets/images/splash.png";
      case TypeImage.SPLASH_SOILD_IMAGE:
        return "assets/images/splash2.png";
    }
  }
}
