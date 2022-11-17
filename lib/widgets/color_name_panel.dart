// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../data/named_colors.dart';

/// A widget filled with a specified color, that displays the color name and animates color changes.
class ColorNamePanel extends StatelessWidget {
  const ColorNamePanel({
    Key? key,
    required this.namedColor,
  }) : super(key: key);

  /// The named color being displayed.
  final NamedColor namedColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      color: namedColor.color,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'I\'m\n',
          style: DefaultTextStyle.of(context).style.copyWith(color: namedColor.contrastColor),
          children: <TextSpan>[
            TextSpan(
              text: namedColor.name,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: namedColor.contrastColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
