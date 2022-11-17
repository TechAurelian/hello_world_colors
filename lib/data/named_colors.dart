// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// cSpell:ignore Cornsilk, Gainsboro, Rebecca

import 'dart:math';
import 'dart:ui';

import '../utils/color_utils.dart' as color_utils;

/// An immutable color with a name and a Color object.
class NamedColor {
  /// The name of the color.
  final String name;

  /// The [Color] value of the color.
  final Color color;

  /// Creates a new [NamedColor] with the given name and [Color] value.
  const NamedColor(this.name, this.color);

  /// The black or white contrast color for this color.
  Color get contrastColor => color_utils.getContrastColor(color);
}

/// Generates a random CSS named color.
///
/// The returned [NamedColor] has both a [Color] value and a name.
NamedColor nextRandomColor({Random? random}) {
  // No random generator? Return the default color.
  if (random == null) {
    return _webColors[0];
  }

  final int randomIndex = random.nextInt(_webColors.length);
  return _webColors[randomIndex];
}

/// A list of named colors, that are randomly displayed by this app.
///
/// Based on [CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/) named colors.
const List<NamedColor> _webColors = [
  NamedColor('Alice Blue', Color(0xFFF0F8FF)),
  NamedColor('Antique White', Color(0xFFFAEBD7)),
  NamedColor('Aqua', Color(0xFF00FFFF)),
  NamedColor('Aquamarine', Color(0xFF7FFFD4)),
  NamedColor('Azure', Color(0xFFF0FFFF)),
  NamedColor('Beige', Color(0xFFF5F5DC)),
  NamedColor('Bisque', Color(0xFFFFE4C4)),
  NamedColor('Black', Color(0xFF000000)),
  NamedColor('Blanched Almond', Color(0xFFFFEBCD)),
  NamedColor('Blue', Color(0xFF0000FF)),
  NamedColor('Blue Violet', Color(0xFF8A2BE2)),
  NamedColor('Brown', Color(0xFFA52A2A)),
  NamedColor('Burly Wood', Color(0xFFDEB887)),
  NamedColor('Cadet Blue', Color(0xFF5F9EA0)),
  NamedColor('Chartreuse', Color(0xFF7FFF00)),
  NamedColor('Chocolate', Color(0xFFD2691E)),
  NamedColor('Coral', Color(0xFFFF7F50)),
  NamedColor('Cornflower Blue', Color(0xFF6495ED)),
  NamedColor('Cornsilk', Color(0xFFFFF8DC)),
  NamedColor('Crimson', Color(0xFFDC143C)),
  NamedColor('Cyan', Color(0xFF00FFFF)),
  NamedColor('Dark Blue', Color(0xFF00008B)),
  NamedColor('Dark Cyan', Color(0xFF008B8B)),
  NamedColor('Dark Golden Rod', Color(0xFFB8860B)),
  NamedColor('Dark Gray', Color(0xFFA9A9A9)),
  NamedColor('Dark Green', Color(0xFF006400)),
  NamedColor('Dark Grey', Color(0xFFA9A9A9)),
  NamedColor('Dark Khaki', Color(0xFFBDB76B)),
  NamedColor('Dark Magenta', Color(0xFF8B008B)),
  NamedColor('Dark Olive Green', Color(0xFF556B2F)),
  NamedColor('Dark Orange', Color(0xFFFF8C00)),
  NamedColor('Dark Orchid', Color(0xFF9932CC)),
  NamedColor('Dark Red', Color(0xFF8B0000)),
  NamedColor('Dark Salmon', Color(0xFFE9967A)),
  NamedColor('Dark Sea Green', Color(0xFF8FBC8F)),
  NamedColor('Dark Slate Blue', Color(0xFF483D8B)),
  NamedColor('Dark Slate Gray', Color(0xFF2F4F4F)),
  NamedColor('Dark Slate Grey', Color(0xFF2F4F4F)),
  NamedColor('Dark Turquoise', Color(0xFF00CED1)),
  NamedColor('Dark Violet', Color(0xFF9400D3)),
  NamedColor('Deep Pink', Color(0xFFFF1493)),
  NamedColor('Deep Sky Blue', Color(0xFF00BFFF)),
  NamedColor('Dim Gray', Color(0xFF696969)),
  NamedColor('Dim Grey', Color(0xFF696969)),
  NamedColor('Dodger Blue', Color(0xFF1E90FF)),
  NamedColor('Fire Brick', Color(0xFFB22222)),
  NamedColor('Floral White', Color(0xFFFFFAF0)),
  NamedColor('Forest Green', Color(0xFF228B22)),
  NamedColor('Fuchsia', Color(0xFFFF00FF)),
  NamedColor('Gainsboro', Color(0xFFDCDCDC)),
  NamedColor('Ghost White', Color(0xFFF8F8FF)),
  NamedColor('Gold', Color(0xFFFFD700)),
  NamedColor('Golden Rod', Color(0xFFDAA520)),
  NamedColor('Gray', Color(0xFF808080)),
  NamedColor('Green', Color(0xFF008000)),
  NamedColor('Green Yellow', Color(0xFFADFF2F)),
  NamedColor('Grey', Color(0xFF808080)),
  NamedColor('Honey Dew', Color(0xFFF0FFF0)),
  NamedColor('Hot Pink', Color(0xFFFF69B4)),
  NamedColor('Indian Red', Color(0xFFCD5C5C)),
  NamedColor('Indigo', Color(0xFF4B0082)),
  NamedColor('Ivory', Color(0xFFFFFFF0)),
  NamedColor('Khaki', Color(0xFFF0E68C)),
  NamedColor('Lavender', Color(0xFFE6E6FA)),
  NamedColor('Lavender Blush', Color(0xFFFFF0F5)),
  NamedColor('Lawn Green', Color(0xFF7CFC00)),
  NamedColor('Lemon Chiffon', Color(0xFFFFFACD)),
  NamedColor('Light Blue', Color(0xFFADD8E6)),
  NamedColor('Light Coral', Color(0xFFF08080)),
  NamedColor('Light Cyan', Color(0xFFE0FFFF)),
  NamedColor('Light Golden Rod Yellow', Color(0xFFFAFAD2)),
  NamedColor('Light Gray', Color(0xFFD3D3D3)),
  NamedColor('Light Green', Color(0xFF90EE90)),
  NamedColor('Light Grey', Color(0xFFD3D3D3)),
  NamedColor('Light Pink', Color(0xFFFFB6C1)),
  NamedColor('Light Salmon', Color(0xFFFFA07A)),
  NamedColor('Light Sea Green', Color(0xFF20B2AA)),
  NamedColor('Light Sky Blue', Color(0xFF87CEFA)),
  NamedColor('Light Slate Gray', Color(0xFF778899)),
  NamedColor('Light Slate Grey', Color(0xFF778899)),
  NamedColor('Light Steel Blue', Color(0xFFB0C4DE)),
  NamedColor('Light Yellow', Color(0xFFFFFFE0)),
  NamedColor('Lime', Color(0xFF00FF00)),
  NamedColor('Lime Green', Color(0xFF32CD32)),
  NamedColor('Linen', Color(0xFFFAF0E6)),
  NamedColor('Magenta', Color(0xFFFF00FF)),
  NamedColor('Maroon', Color(0xFF800000)),
  NamedColor('Medium Aqua Marine', Color(0xFF66CDAA)),
  NamedColor('Medium Blue', Color(0xFF0000CD)),
  NamedColor('Medium Orchid', Color(0xFFBA55D3)),
  NamedColor('Medium Purple', Color(0xFF9370DB)),
  NamedColor('Medium Sea Green', Color(0xFF3CB371)),
  NamedColor('Medium Slate Blue', Color(0xFF7B68EE)),
  NamedColor('Medium Spring Green', Color(0xFF00FA9A)),
  NamedColor('Medium Turquoise', Color(0xFF48D1CC)),
  NamedColor('Medium Violet Red', Color(0xFFC71585)),
  NamedColor('Midnight Blue', Color(0xFF191970)),
  NamedColor('Mint Cream', Color(0xFFF5FFFA)),
  NamedColor('Misty Rose', Color(0xFFFFE4E1)),
  NamedColor('Moccasin', Color(0xFFFFE4B5)),
  NamedColor('Navajo White', Color(0xFFFFDEAD)),
  NamedColor('Navy', Color(0xFF000080)),
  NamedColor('Old Lace', Color(0xFFFDF5E6)),
  NamedColor('Olive', Color(0xFF808000)),
  NamedColor('Olive Drab', Color(0xFF6B8E23)),
  NamedColor('Orange', Color(0xFFFFA500)),
  NamedColor('Orange Red', Color(0xFFFF4500)),
  NamedColor('Orchid', Color(0xFFDA70D6)),
  NamedColor('Pale Golden Rod', Color(0xFFEEE8AA)),
  NamedColor('Pale Green', Color(0xFF98FB98)),
  NamedColor('Pale Turquoise', Color(0xFFAFEEEE)),
  NamedColor('Pale Violet Red', Color(0xFFDB7093)),
  NamedColor('Papaya Whip', Color(0xFFFFEFD5)),
  NamedColor('Peach Puff', Color(0xFFFFDAB9)),
  NamedColor('Peru', Color(0xFFCD853F)),
  NamedColor('Pink', Color(0xFFFFC0CB)),
  NamedColor('Plum', Color(0xFFDDA0DD)),
  NamedColor('Powder Blue', Color(0xFFB0E0E6)),
  NamedColor('Purple', Color(0xFF800080)),
  NamedColor('Rebecca Purple', Color(0xFF663399)),
  NamedColor('Red', Color(0xFFFF0000)),
  NamedColor('Rosy Brown', Color(0xFFBC8F8F)),
  NamedColor('Royal Blue', Color(0xFF4169E1)),
  NamedColor('Saddle Brown', Color(0xFF8B4513)),
  NamedColor('Salmon', Color(0xFFFA8072)),
  NamedColor('Sandy Brown', Color(0xFFF4A460)),
  NamedColor('Sea Green', Color(0xFF2E8B57)),
  NamedColor('Sea Shell', Color(0xFFFFF5EE)),
  NamedColor('Sienna', Color(0xFFA0522D)),
  NamedColor('Silver', Color(0xFFC0C0C0)),
  NamedColor('Sky Blue', Color(0xFF87CEEB)),
  NamedColor('Slate Blue', Color(0xFF6A5ACD)),
  NamedColor('Slate Gray', Color(0xFF708090)),
  NamedColor('Slate Grey', Color(0xFF708090)),
  NamedColor('Snow', Color(0xFFFFFAFA)),
  NamedColor('Spring Green', Color(0xFF00FF7F)),
  NamedColor('Steel Blue', Color(0xFF4682B4)),
  NamedColor('Tan', Color(0xFFD2B48C)),
  NamedColor('Teal', Color(0xFF008080)),
  NamedColor('Thistle', Color(0xFFD8BFD8)),
  NamedColor('Tomato', Color(0xFFFF6347)),
  NamedColor('Turquoise', Color(0xFF40E0D0)),
  NamedColor('Violet', Color(0xFFEE82EE)),
  NamedColor('Wheat', Color(0xFFF5DEB3)),
  NamedColor('White', Color(0xFFFFFFFF)),
  NamedColor('White Smoke', Color(0xFFF5F5F5)),
  NamedColor('Yellow', Color(0xFFFFFF00)),
  NamedColor('Yellow Green', Color(0xFF9ACD32)),
];
