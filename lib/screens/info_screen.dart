// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/app_strings.dart' as appstrings;
import '../data/named_colors.dart';
import '../utils/color_utils.dart' as color_utils;
import '../utils/utils.dart';

/// A screen that shows information about a named color. Each piece of information can be copied to
/// the clipboard. The user can also perform a web search to get more information.
class InfoScreen extends StatelessWidget {
  const InfoScreen({
    Key? key,
    required this.namedColor,
  }) : super(key: key);

  /// The color name and code that is displayed in the info screen.
  final NamedColor namedColor;

  /// When one of the copy buttons is pressed, copy the associated color value to the Clipboard,
  /// and show a confirmation snackbar.
  Future<void> _onCopyPressed(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    // Waiting for context.mounted, in the meantime ignore the warning.
    // ignore: use_build_context_synchronously
    showSnackBar(context, appstrings.infoCopied(value));
  }

  @override
  Widget build(BuildContext context) {
    final Color color = namedColor.color;

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text(appstrings.infoScreenTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: namedColor.contrastColor),
          child: Table(
            border: TableBorder.all(color: namedColor.contrastColor.withOpacity(0.25)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(2),
              2: IntrinsicColumnWidth(),
            },
            children: [
              _buildInfo(context, appstrings.infoName, namedColor.name),
              _buildInfo(context, appstrings.infoHex, color_utils.toHexString(color)),
              _buildInfo(context, appstrings.infoRGB, color_utils.toRGBString(color)),
              _buildInfo(context, appstrings.infoHSV, color_utils.toHSVString(color)),
              _buildInfo(context, appstrings.infoHSL, color_utils.toHSLString(color)),
              _buildInfo(context, appstrings.infoDecimal, '${color.withAlpha(0).value}'),
              _buildInfo(
                context,
                appstrings.infoLuminance,
                color.computeLuminance().toStringAsFixed(5),
              ),
              _buildInfo(
                context,
                appstrings.infoBrightness,
                describeEnum(ThemeData.estimateBrightnessForColor(color)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a color information table row, with the specified key and value, and a copy button.
  TableRow _buildInfo(BuildContext context, String key, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(key),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(value),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: namedColor.contrastColor),
          onPressed: () => _onCopyPressed(context, value),
          child: const Text(appstrings.infoCopy),
        ),
      ],
    );
  }
}
