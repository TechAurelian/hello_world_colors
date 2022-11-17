// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

/// Provides color utility functions.

import 'package:flutter/material.dart';

/// Converts a Color value into a hexadecimal color string.
String toHexString(Color color) {
  return '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

/// Returns the black or white contrast color of a given color.
Color getContrastColor(Color color) {
  return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
      ? Colors.white
      : Colors.black;
}

/// Returns the RGB string representation of a [Color].
String toRGBString(Color color) {
  return '${color.red}, ${color.green}, ${color.blue}';
}

/// Returns the HSV string representation of a [Color].
String toHSVString(Color color) {
  HSVColor hsvColor = HSVColor.fromColor(color);
  return '${hsvColor.hue.toStringAsFixed(0)}°, ${(hsvColor.saturation * 100).toStringAsFixed(0)}%, ${(hsvColor.value * 100).toStringAsFixed(0)}%';
}

/// Returns the HSL string representation of a [Color].
String toHSLString(Color color) {
  HSLColor hslColor = HSLColor.fromColor(color);
  return '${hslColor.hue.toStringAsFixed(0)}°, ${(hslColor.saturation * 100).toStringAsFixed(0)}%, ${(hslColor.lightness * 100).toStringAsFixed(0)}%';
}
