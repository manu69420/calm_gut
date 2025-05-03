import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 82, 171, 191),
      surfaceTint: Color.fromARGB(255, 34, 126, 119),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color.fromARGB(255, 188, 227, 222),
      onPrimaryContainer: Color.fromARGB(255, 67, 99, 97),
      secondary: Color(0xff4a6360),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color.fromARGB(255, 193, 216, 208),
      onSecondaryContainer: Color(0xff324b48),
      tertiary: Color.fromARGB(255, 246, 210, 194),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color.fromARGB(255, 246, 222, 227),
      onTertiaryContainer: Color.fromARGB(255, 43, 25, 34),
      error: Color(0xff904a42),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff73342d),
      surface: Color.fromARGB(255, 236, 250, 243),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3f4947),
      outline: Color(0xff6f7977),
      outlineVariant: Color(0xffbec9c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff81d5cb),
      primaryFixed: Color(0xff9df2e7),
      onPrimaryFixed: Color(0xff00201d),
      primaryFixedDim: Color(0xff81d5cb),
      onPrimaryFixedVariant: Color(0xff00504a),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff051f1d),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff324b48),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff390721),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff6e334d),
      surfaceDim: Color(0xffd5dbd9),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color.fromARGB(255, 233, 247, 241),
      surfaceContainer: Color.fromARGB(255, 229, 242, 236),
      surfaceContainerHigh: Color(0xffe3eae7),
      surfaceContainerHighest: Color(0xffdde4e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003e39),
      surfaceTint: Color(0xff006a62),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1b7a71),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223b37),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff58726e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5a233d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9b5874),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e231e),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa25850),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff0c1211),
      onSurfaceVariant: Color(0xff2e3836),
      outline: Color(0xff4b5453),
      outlineVariant: Color(0xff656f6d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff81d5cb),
      primaryFixed: Color(0xff1b7a71),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006058),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff58726e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff405a56),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9b5874),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7f415c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1c8c6),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f3),
      surfaceContainer: Color(0xffe3eae7),
      surfaceContainerHigh: Color(0xffd8dedc),
      surfaceContainerHighest: Color(0xffccd3d1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00322e),
      surfaceTint: Color(0xff006a62),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00534c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff17302d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354e4a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4e1832),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff713550),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a15),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242e2c),
      outlineVariant: Color(0xff414b49),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff81d5cb),
      primaryFixed: Color(0xff00534c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003a35),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354e4a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e3734),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff713550),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff561f39),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4bab8),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f0),
      surfaceContainer: Color(0xffdde4e2),
      surfaceContainerHigh: Color(0xffcfd6d4),
      surfaceContainerHighest: Color(0xffc1c8c6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff81d5cb),
      surfaceTint: Color(0xff81d5cb),
      onPrimary: Color(0xff003733),
      primaryContainer: Color(0xff00504a),
      onPrimaryContainer: Color(0xff9df2e7),
      secondary: Color(0xffb1ccc7),
      onSecondary: Color(0xff1c3532),
      secondaryContainer: Color(0xff324b48),
      onSecondaryContainer: Color(0xffcce8e3),
      tertiary: Color(0xffffb0ce),
      onTertiary: Color(0xff531d37),
      tertiaryContainer: Color(0xff6e334d),
      onTertiaryContainer: Color(0xffffd9e5),
      error: Color(0xffffb4aa),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffdde4e2),
      onSurfaceVariant: Color(0xffbec9c6),
      outline: Color(0xff899391),
      outlineVariant: Color(0xff3f4947),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff006a62),
      primaryFixed: Color(0xff9df2e7),
      onPrimaryFixed: Color(0xff00201d),
      primaryFixedDim: Color(0xff81d5cb),
      onPrimaryFixedVariant: Color(0xff00504a),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff051f1d),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff324b48),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff390721),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff6e334d),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff343a39),
      surfaceContainerLowest: Color(0xff090f0e),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff303635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff97ebe1),
      surfaceTint: Color(0xff81d5cb),
      onPrimary: Color(0xff002b28),
      primaryContainer: Color(0xff499e95),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc6e2dd),
      onSecondary: Color(0xff102a27),
      secondaryContainer: Color(0xff7b9692),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd0e0),
      onTertiary: Color(0xff46122c),
      tertiaryContainer: Color(0xffc37b98),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff48130f),
      errorContainer: Color(0xffcc7b71),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dfdc),
      outline: Color(0xffaab4b2),
      outlineVariant: Color(0xff889290),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff00514b),
      primaryFixed: Color(0xff9df2e7),
      onPrimaryFixed: Color(0xff001512),
      primaryFixedDim: Color(0xff81d5cb),
      onPrimaryFixedVariant: Color(0xff003e39),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff001512),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff223b37),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff2b0016),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff5a233d),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff3f4644),
      surfaceContainerLowest: Color(0xff040808),
      surfaceContainerLow: Color(0xff181f1e),
      surfaceContainer: Color(0xff232928),
      surfaceContainerHigh: Color(0xff2d3433),
      surfaceContainerHighest: Color(0xff383f3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffadfff4),
      surfaceTint: Color(0xff81d5cb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7dd1c7),
      onPrimaryContainer: Color(0xff000e0c),
      secondary: Color(0xffdaf6f1),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffadc8c4),
      onSecondaryContainer: Color(0xff000e0c),
      tertiary: Color(0xffffebf0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfffbaccb),
      onTertiaryContainer: Color(0xff20000f),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2ef),
      outlineVariant: Color(0xffbac5c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff00514b),
      primaryFixed: Color(0xff9df2e7),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff81d5cb),
      onPrimaryFixedVariant: Color(0xff001512),
      secondaryFixed: Color(0xffcce8e3),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1ccc7),
      onSecondaryFixedVariant: Color(0xff001512),
      tertiaryFixed: Color(0xffffd9e5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb0ce),
      onTertiaryFixedVariant: Color(0xff2b0016),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff4b5150),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1a2120),
      surfaceContainer: Color(0xff2b3231),
      surfaceContainerHigh: Color(0xff363d3b),
      surfaceContainerHighest: Color(0xff414847),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
