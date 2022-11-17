// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../data/named_colors.dart';

/// A screen filled with the specified color, with only the default back action in the app bar.
class ColorScreen extends StatelessWidget {
  const ColorScreen({
    Key? key,
    required this.namedColor,
  }) : super(key: key);

  /// The color to fill the screen with.
  final NamedColor namedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: namedColor.color,
      appBar: AppBar(
        backgroundColor: namedColor.color,
        foregroundColor: namedColor.contrastColor,
        elevation: 0.0,
      ),
    );
  }
}
