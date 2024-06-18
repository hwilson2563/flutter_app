import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF206487),
      surfaceTint: Color(0xFF206487),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFC6E7FF),
      onPrimaryContainer: Color(0xFF001E2D),
      secondary: Color(0xFF8D4D2C),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFFF7C33),
      onSecondaryContainer: Color(0xFF2C0C00),
      tertiary: Color(0xFF2C638B),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFCCE5FF),
      onTertiaryContainer: Color(0xFF001D31),
      error: Color(0xFF8F4A4B),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD9),
      onErrorContainer: Color(0xFF3B080D),
      background: Color(0xFFF6FAFE),
      onBackground: Color(0xFF181C1F),
      surface: Color(0xFFF6FAFE),
      onSurface: Color(0xFF181C1F),
      surfaceVariant: Color(0xFFDDE3EA),
      onSurfaceVariant: Color(0xFF41484D),
      outline: Color(0xFF71787E),
      outlineVariant: Color(0xFFC1C7CE),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2C3135),
      inverseOnSurface: Color(0xFFEEF1F6),
      inversePrimary: Color(0xFF92CEF5),
      primaryFixed: Color(0xFFC6E7FF),
      onPrimaryFixed: Color(0xFF001E2D),
      primaryFixedDim: Color(0xFF92CEF5),
      onPrimaryFixedVariant: Color(0xFF004C6B),
      secondaryFixed: Color(0xFFFFDBCC),
      onSecondaryFixed: Color(0xFF351000),
      secondaryFixedDim: Color(0xFFFFB693),
      onSecondaryFixedVariant: Color(0xFF703718),
      tertiaryFixed: Color(0xFFCCE5FF),
      onTertiaryFixed: Color(0xFF001D31),
      tertiaryFixedDim: Color(0xFF99CCF9),
      onTertiaryFixedVariant: Color(0xFF064B72),
      surfaceDim: Color(0xFFD7DADF),
      surfaceBright: Color(0xFFF6FAFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF0F4F8),
      surfaceContainer: Color(0xFFEBEEF3),
      surfaceContainerHigh: Color(0xFFE5E8ED),
      surfaceContainerHighest: Color(0xFFDFE3E7),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF004865),
      surfaceTint: Color(0xFF206487),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF3C7B9F),
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFF6B3314),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFA86340),
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(0xFF00476D),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF4579A3),
      onTertiaryContainer: Color(0xFFFFFFFF),
      error: Color(0xFF6E2F31),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFAA5F60),
      onErrorContainer: Color(0xFFFFFFFF),
      background: Color(0xFFF6FAFE),
      onBackground: Color(0xFF181C1F),
      surface: Color(0xFFF6FAFE),
      onSurface: Color(0xFF181C1F),
      surfaceVariant: Color(0xFFDDE3EA),
      onSurfaceVariant: Color(0xFF3D4449),
      outline: Color(0xFF596066),
      outlineVariant: Color(0xFF757C81),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2C3135),
      inverseOnSurface: Color(0xFFEEF1F6),
      inversePrimary: Color(0xFF92CEF5),
      primaryFixed: Color(0xFF3C7B9F),
      onPrimaryFixed: Color(0xFFFFFFFF),
      primaryFixedDim: Color(0xFF1D6284),
      onPrimaryFixedVariant: Color(0xFFFFFFFF),
      secondaryFixed: Color(0xFFA86340),
      onSecondaryFixed: Color(0xFFFFFFFF),
      secondaryFixedDim: Color(0xFF8A4B2A),
      onSecondaryFixedVariant: Color(0xFFFFFFFF),
      tertiaryFixed: Color(0xFF4579A3),
      onTertiaryFixed: Color(0xFFFFFFFF),
      tertiaryFixedDim: Color(0xFF296088),
      onTertiaryFixedVariant: Color(0xFFFFFFFF),
      surfaceDim: Color(0xFFD7DADF),
      surfaceBright: Color(0xFFF6FAFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF0F4F8),
      surfaceContainer: Color(0xFFEBEEF3),
      surfaceContainerHigh: Color(0xFFE5E8ED),
      surfaceContainerHighest: Color(0xFFDFE3E7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF002537),
      surfaceTint: Color(0xFF206487),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF004865),
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFF3F1500),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF6B3314),
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(0xFF00243B),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF00476D),
      onTertiaryContainer: Color(0xFFFFFFFF),
      error: Color(0xFF440F13),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFF6E2F31),
      onErrorContainer: Color(0xFFFFFFFF),
      background: Color(0xFFF6FAFE),
      onBackground: Color(0xFF181C1F),
      surface: Color(0xFFF6FAFE),
      onSurface: Color(0xFF000000),
      surfaceVariant: Color(0xFFDDE3EA),
      onSurfaceVariant: Color(0xFF1E252A),
      outline: Color(0xFF3D4449),
      outlineVariant: Color(0xFF3D4449),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2C3135),
      inverseOnSurface: Color(0xFFFFFFFF),
      inversePrimary: Color(0xFFDAEFFF),
      primaryFixed: Color(0xFF004865),
      onPrimaryFixed: Color(0xFFFFFFFF),
      primaryFixedDim: Color(0xFF003046),
      onPrimaryFixedVariant: Color(0xFFFFFFFF),
      secondaryFixed: Color(0xFF6B3314),
      onSecondaryFixed: Color(0xFFFFFFFF),
      secondaryFixedDim: Color(0xFF4F1E02),
      onSecondaryFixedVariant: Color(0xFFFFFFFF),
      tertiaryFixed: Color(0xFF00476D),
      onTertiaryFixed: Color(0xFFFFFFFF),
      tertiaryFixedDim: Color(0xFF002F4B),
      onTertiaryFixedVariant: Color(0xFFFFFFFF),
      surfaceDim: Color(0xFFD7DADF),
      surfaceBright: Color(0xFFF6FAFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF0F4F8),
      surfaceContainer: Color(0xFFEBEEF3),
      surfaceContainerHigh: Color(0xFFE5E8ED),
      surfaceContainerHighest: Color(0xFFDFE3E7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF92CEF5),
      surfaceTint: Color(0xFF92CEF5),
      onPrimary: Color(0xFF00344B),
      primaryContainer: Color(0xFF004C6B),
      onPrimaryContainer: Color(0xFFC6E7FF),
      secondary: Color(0xFFFFB693),
      onSecondary: Color(0xFF542104),
      secondaryContainer: Color(0xFF703718),
      onSecondaryContainer: Color(0xFFFFDBCC),
      tertiary: Color(0xFF99CCF9),
      onTertiary: Color(0xFF003351),
      tertiaryContainer: Color(0xFF064B72),
      onTertiaryContainer: Color(0xFFCCE5FF),
      error: Color(0xFFFFB3B3),
      onError: Color(0xFF561D20),
      errorContainer: Color(0xFF733335),
      onErrorContainer: Color(0xFFFFDAD9),
      background: Color(0xFF0F1417),
      onBackground: Color(0xFFDFE3E7),
      surface: Color(0xFF0F1417),
      onSurface: Color(0xFFDFE3E7),
      surfaceVariant: Color(0xFF41484D),
      onSurfaceVariant: Color(0xFFC1C7CE),
      outline: Color(0xFF8B9198),
      outlineVariant: Color(0xFF41484D),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFDFE3E7),
      inverseOnSurface: Color(0xFF2C3135),
      inversePrimary: Color(0xFF206487),
      primaryFixed: Color(0xFFC6E7FF),
      onPrimaryFixed: Color(0xFF001E2D),
      primaryFixedDim: Color(0xFF92CEF5),
      onPrimaryFixedVariant: Color(0xFF004C6B),
      secondaryFixed: Color(0xFFFFDBCC),
      onSecondaryFixed: Color(0xFF351000),
      secondaryFixedDim: Color(0xFFFFB693),
      onSecondaryFixedVariant: Color(0xFF703718),
      tertiaryFixed: Color(0xFFCCE5FF),
      onTertiaryFixed: Color(0xFF001D31),
      tertiaryFixedDim: Color(0xFF99CCF9),
      onTertiaryFixedVariant: Color(0xFF064B72),
      surfaceDim: Color(0xFF0F1417),
      surfaceBright: Color(0xFF353A3D),
      surfaceContainerLowest: Color(0xFF0A0F12),
      surfaceContainerLow: Color(0xFF181C1F),
      surfaceContainer: Color(0xFF1C2024),
      surfaceContainerHigh: Color(0xFF262B2E),
      surfaceContainerHighest: Color(0xFF313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF96D2F9),
      surfaceTint: Color(0xFF92CEF5),
      onPrimary: Color(0xFF001926),
      primaryContainer: Color(0xFF5B97BC),
      onPrimaryContainer: Color(0xFF000000),
      secondary: Color(0xFFFFBC9C),
      onSecondary: Color(0xFF2C0C00),
      secondaryContainer: Color(0xFFC97E59),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xFF9DD0FE),
      onTertiary: Color(0xFF001829),
      tertiaryContainer: Color(0xFF6296C1),
      onTertiaryContainer: Color(0xFF000000),
      error: Color(0xFFFFB9B9),
      onError: Color(0xFF340408),
      errorContainer: Color(0xFFCB7A7B),
      onErrorContainer: Color(0xFF000000),
      background: Color(0xFF0F1417),
      onBackground: Color(0xFFDFE3E7),
      surface: Color(0xFF0F1417),
      onSurface: Color(0xFFF8FBFF),
      surfaceVariant: Color(0xFF41484D),
      onSurfaceVariant: Color(0xFFC5CBD2),
      outline: Color(0xFF9DA4AA),
      outlineVariant: Color(0xFF7D848A),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFDFE3E7),
      inverseOnSurface: Color(0xFF262B2E),
      inversePrimary: Color(0xFF004D6D),
      primaryFixed: Color(0xFFC6E7FF),
      onPrimaryFixed: Color(0xFF00131E),
      primaryFixedDim: Color(0xFF92CEF5),
      onPrimaryFixedVariant: Color(0xFF003A53),
      secondaryFixed: Color(0xFFFFDBCC),
      onSecondaryFixed: Color(0xFF240900),
      secondaryFixedDim: Color(0xFFFFB693),
      onSecondaryFixedVariant: Color(0xFF5B2708),
      tertiaryFixed: Color(0xFFCCE5FF),
      onTertiaryFixed: Color(0xFF001321),
      tertiaryFixedDim: Color(0xFF99CCF9),
      onTertiaryFixedVariant: Color(0xFF00395A),
      surfaceDim: Color(0xFF0F1417),
      surfaceBright: Color(0xFF353A3D),
      surfaceContainerLowest: Color(0xFF0A0F12),
      surfaceContainerLow: Color(0xFF181C1F),
      surfaceContainer: Color(0xFF1C2024),
      surfaceContainerHigh: Color(0xFF262B2E),
      surfaceContainerHighest: Color(0xFF313539),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFF8FBFF),
      surfaceTint: Color(0xFF92CEF5),
      onPrimary: Color(0xFF000000),
      primaryContainer: Color(0xFF96D2F9),
      onPrimaryContainer: Color(0xFF000000),
      secondary: Color(0xFFFFF9F8),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFFFBC9C),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xFFF9FBFF),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF9DD0FE),
      onTertiaryContainer: Color(0xFF000000),
      error: Color(0xFFFFF9F9),
      onError: Color(0xFF000000),
      errorContainer: Color(0xFFFFB9B9),
      onErrorContainer: Color(0xFF000000),
      background: Color(0xFF0F1417),
      onBackground: Color.fromRGBO(223, 227, 231, 1),
      surface: Color(0xFF0F1417),
      onSurface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFF41484D),
      onSurfaceVariant: Color(0xFFF8FBFF),
      outline: Color(0xFFC5CBD2),
      outlineVariant: Color(0xFFC5CBD2),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFDFE3E7),
      inverseOnSurface: Color(0xFF000000),
      inversePrimary: Color(0xFF002D42),
      primaryFixed: Color(0xFFCFEAFF),
      onPrimaryFixed: Color(0xFF000000),
      primaryFixedDim: Color(0xFF96D2F9),
      onPrimaryFixedVariant: Color(0xFF001926),
      secondaryFixed: Color(0xFFFFE1D4),
      onSecondaryFixed: Color(0xFF000000),
      secondaryFixedDim: Color(0xFFFFBC9C),
      onSecondaryFixedVariant: Color(0xFF2C0C00),
      tertiaryFixed: Color(0xFFD5E9FF),
      onTertiaryFixed: Color(0xFF000000),
      tertiaryFixedDim: Color(0xFF9DD0FE),
      onTertiaryFixedVariant: Color(0xFF001829),
      surfaceDim: Color(0xFF0F1417),
      surfaceBright: Color(0xFF353A3D),
      surfaceContainerLowest: Color(0xFF0A0F12),
      surfaceContainerLow: Color(0xFF181C1F),
      surfaceContainer: Color(0xFF1C2024),
      surfaceContainerHigh: Color(0xFF262B2E),
      surfaceContainerHighest: Color(0xFF313539),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
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


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
