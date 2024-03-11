// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color white;
  late Color orange;
  late Color black;
  late Color aquaBreeze;
  late Color gradient2;
  late Color powderBlue;
  late Color melon;
  late Color champagnePink;
  late Color blueOcean;
  late Color customColor1;
  late Color customColor2;
  late Color customColor3;
  late Color customColor4;
  late Color gradient1;
  late Color profileBgr;
  late Color blueLink;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF073763);
  late Color secondary = const Color(0xFF295D8F);
  late Color tertiary = const Color(0xFFAEC5EB);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFF3F3F3F);
  late Color secondaryText = const Color(0xFF3F3F3F);
  late Color primaryBackground = const Color(0xFFF9F9F9);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0xFFD8DADC);
  late Color accent3 = const Color(0xFF838384);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF0EB13B);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFEB4335);
  late Color info = const Color(0xFFFFFFFF);

  late Color white = Color(0xFFFFFFFF);
  late Color orange = Color(0xFFFF8718);
  late Color black = Color(0xFF000000);
  late Color aquaBreeze = Color(0xFF00D3AE);
  late Color gradient2 = Color(0xFF326A9F);
  late Color powderBlue = Color(0xFFAEC5EB);
  late Color melon = Color(0xFFE9AFA3);
  late Color champagnePink = Color(0xFFF9DEC9);
  late Color blueOcean = Color(0xFF18C3D9);
  late Color customColor1 = Color(0xFF753123);
  late Color customColor2 = Color(0xFF3A5481);
  late Color customColor3 = Color(0xFFB06327);
  late Color customColor4 = Color(0xFF295B61);
  late Color gradient1 = Color(0xFF7FFBE5);
  late Color profileBgr = Color(0xFF323232);
  late Color blueLink = Color(0xFF0A66C2);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Sofia Pro';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.white,
        fontWeight: FontWeight.normal,
        fontSize: 30.0,
      );
  String get displayMediumFamily => 'Sofia Pro';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 26.0,
      );
  String get displaySmallFamily => 'Sofia Pro';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
      );
  String get headlineLargeFamily => 'Sofia Pro';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get headlineMediumFamily => 'Sofia Pro';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get headlineSmallFamily => 'Sofia Pro';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get titleLargeFamily => 'Sofia Pro';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Sofia Pro';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Sofia Pro';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Sofia Pro';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Sofia Pro';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Sofia Pro';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Sofia Pro';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Sofia Pro';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Sofia Pro';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Sofia Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
