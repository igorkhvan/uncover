import 'package:flutter/material.dart';

/// //////////////////////////////////////////////////////////////
/// Styles - Contains the design system for the entire app.
/// Includes paddings, text styles, timings etc. Does not include colors, check [AppTheme] file for that.

/// Used for all animations in the  app
class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class FileExtensions {
  static const allowedFileExtensions = ['jpeg', 'jpg', 'png', 'pdf'];
  static const allowedImageExtensions = ['.png', '.jpeg', '.jpg'];
}

class FirmColors {
  static const Color primaryColor = Color(0xff978054);
  static const Color secondaryColor = Color(0xff0c2a45);
  static const Color modalDialogHeaderColor = Color(0xff0c2a45);
}

class PageSizes {
  static const double pageWidth = 1084;
  static const double mainBannerHeight = 120;
  static const double footerHeight = 40;
  static const double tileHeight = 350;
  static const double headerHeight = 80;
  static const double largeModalHeightFactor = 0.8;
  static const double inputFieldWidth = 400;

  static const double verticalGapLg = 50;
  static const double verticalGapMed = 30;
  static const double verticalGapSm = 20;
  static const double verticalGapXs = 10;

  static const double horizontalGapSm = 20;
}

class Sizes {
  static double hitScale = 1;
  static double get hit => 40 * hitScale;
}

class IconSizes {
  static const double scale = 1;
  static const double med = 18;
}

class Insets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get med => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class Corners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 5;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
    BoxShadow(color: const Color(0xff333333).withOpacity(.15), spreadRadius: 0, blurRadius: 10),
  ];
  static List<BoxShadow> get small => [
    BoxShadow(color: const Color(0xff333333).withOpacity(.15), spreadRadius: 0, blurRadius: 3, offset: const Offset(0, 1)),
  ];
}

/// Font Sizes
/// You can use these directly if you need, but usually there should be a predefined style in TextStyles.
class FontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get scale => 1;
  static double get s10 => 10 * scale;
  static double get s11 => 11 * scale;
  static double get s12 => 12 * scale;
  static double get s14 => 14 * scale;
  static double get s16 => 16 * scale;
  static double get s18 => 18 * scale;
  static double get s24 => 24 * scale;
  static double get s30 => 30 * scale;
  static double get s48 => 48 * scale;
}

/// Fonts - A list of Font Families, this is uses by the TextStyles class to create concrete styles.
class Fonts {
  static const String arial = "Arial";
  static const String chianti = "Chianti";
}

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = TextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)`
class TextStyles {
  /// Declare a base style for each Family
  static const TextStyle arial = TextStyle(fontFamily: Fonts.arial, fontWeight: FontWeight.w400, height: 1, color: Colors.black);
  static const TextStyle chianti = TextStyle(fontFamily: Fonts.chianti, fontWeight: FontWeight.w400, height: 1);

  static TextStyle get h1 =>
      arial.copyWith(fontWeight: FontWeight.w300, fontSize: FontSizes.s30, letterSpacing: -1, height: 1.17);
  static TextStyle get h2 => h1.copyWith(fontSize: FontSizes.s18, letterSpacing: -.5, height: 1.16);
  static TextStyle get h3 => h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);
  static TextStyle get title1 => arial.copyWith(fontWeight: FontWeight.normal, fontSize: FontSizes.s18, height: 1.31);
  static TextStyle get title2 => title1.copyWith(fontWeight: FontWeight.w500, fontSize: FontSizes.s14, height: 1.36);
  static TextStyle get body1 => arial.copyWith(fontWeight: FontWeight.normal, fontSize: FontSizes.s14, height: 1.71);
  static TextStyle get body2 => body1.copyWith(fontSize: FontSizes.s12, height: 1.5, letterSpacing: .2);
  static TextStyle get body3 => body1.copyWith(fontSize: FontSizes.s12, height: 1.5, fontWeight: FontWeight.bold);
  static TextStyle get callout1 =>
      arial.copyWith(fontWeight: FontWeight.w800, fontSize: FontSizes.s12, height: 1.17, letterSpacing: .5);
  static TextStyle get callout2 => callout1.copyWith(fontSize: FontSizes.s10, height: 1, letterSpacing: .25);
  static TextStyle get caption => arial.copyWith(fontWeight: FontWeight.w500, fontSize: FontSizes.s11, height: 1.36);
}
