// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import '../common/app_const.dart' as appconst;
import '../common/app_strings.dart' as appstrings;
import '../data/named_colors.dart';
import '../utils/color_utils.dart' as color_utils;
import '../utils/utils.dart' as utils;
import '../widgets/color_name_panel.dart';
import '../widgets/home_app_bar.dart';
import 'color_screen.dart';
import 'info_screen.dart';

/// The main (default) screen of the app.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The Random generator used to shuffle colors.
  late Random _random;

  /// The current named color.
  NamedColor _namedColor = nextRandomColor();

  /// Create the Random generator, and shuffle the color on init state.
  @override
  void initState() {
    super.initState();
    try {
      _random = Random.secure();
    } on UnsupportedError {
      _random = Random();
    }

    _shuffleColor();
  }

  /// Sets the current color to a new random color from the huge builtin list of colors.
  void _shuffleColor() {
    _namedColor = nextRandomColor(random: _random);
  }

  /// When the FAB button is pressed, shuffle the color and update the screen.
  void _onFabPressed() {
    setState(() {
      _shuffleColor();
    });
  }

  /// Summons the platform's share sheet to share a message containing the color name and code.
  Future<void> _shareColor() async {
    Share.share(
      appstrings.shareText(_namedColor.name, color_utils.toHexString(_namedColor.color)),
      subject: appstrings.appName,
    );
  }

  /// Perform the actions of the app bar.
  void _onAppBarAction(HomeAppBarOverflowActions action) {
    switch (action) {
      // Navigate to the Color Screen.
      case HomeAppBarOverflowActions.colorScreen:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ColorScreen(namedColor: _namedColor)),
        );
        break;
      // Navigate to the Info Screen.
      case HomeAppBarOverflowActions.infoScreen:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoScreen(namedColor: _namedColor)),
        );
        break;
      // Share the color.
      case HomeAppBarOverflowActions.share:
        _shareColor();
        break;
      // Open the Google Play app page to allow the user to rate the app.
      case HomeAppBarOverflowActions.rate:
        utils.launchUrlExternal(context, appconst.rateAppUrl);
        break;
      // Open the app home page in the default browser.
      case HomeAppBarOverflowActions.what:
        utils.launchUrlExternal(context, appconst.appHomeUrl);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onAction: _onAppBarAction,
      ),
      body: ColorNamePanel(
        namedColor: _namedColor,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: appstrings.homeFabTooltip,
        onPressed: _onFabPressed,
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}
