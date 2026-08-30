/// Space between blocks. The screen gutter is [AppSpacing.gutter] on both sides.
class AppSpacing {
  const AppSpacing._();

  static const double gutter = 24;

  static const double spacing100 = 4;
  static const double spacing150 = 6;
  static const double spacing200 = 8;
  static const double spacing250 = 10;
  static const double spacing300 = 12;
  static const double spacing400 = 16;
  static const double spacing450 = 18;
  static const double spacing550 = 22;
  static const double spacing600 = 24;
  static const double spacing700 = 28;
  static const double spacing750 = 30;
  static const double spacing800 = 34;
}

/// Corner radii.
class AppRadius {
  const AppRadius._();

  static const double badge = 6;
  static const double board = 14;
  static const double button = 12;
  static const double card = 12;
  static const double chip = 10;
  static const double full = 999;
  static const double iconButton = 10;
  static const double mark = 2;
  static const double sheet = 22;
  static const double square = 3;
}

/// Fixed sizes the design pins down. Anything tappable is at least [minHitTarget].
class AppSizing {
  const AppSizing._();

  static const double buttonHeight = 52;
  static const double chipHeight = 44;
  static const double glyph = 16;
  static const double hairline = 1;
  static const double iconButton = 36;
  static const double inputHeight = 56;
  static const double listRow = 54;
  static const double markAppBar = 21;
  static const double markSplash = 74;
  static const double minHitTarget = 44;
  static const double segmentedHeight = 48;
}
