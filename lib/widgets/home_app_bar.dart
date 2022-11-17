// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// cSpell:ignore fullscreen

import 'package:flutter/material.dart';

import '../common/app_strings.dart' as appstrings;

/// The actions available in the app bar.
enum HomeAppBarOverflowActions { colorScreen, infoScreen, share, rate, what }

/// The app bar of the Home Screen.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.onAction,
  }) : super(key: key);

  /// The callback that is called when an app bar action is pressed.
  final Function(HomeAppBarOverflowActions action) onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(appstrings.homeScreenTitle),
      actions: [
        IconButton(
          icon: const Icon(Icons.fullscreen),
          tooltip: appstrings.colorScreenActionTooltip,
          onPressed: () => onAction(HomeAppBarOverflowActions.colorScreen),
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: appstrings.infoScreenActionTooltip,
          onPressed: () => onAction(HomeAppBarOverflowActions.infoScreen),
        ),
        PopupMenuButton<HomeAppBarOverflowActions>(
          onSelected: onAction,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<HomeAppBarOverflowActions>>[
            const PopupMenuItem<HomeAppBarOverflowActions>(
              value: HomeAppBarOverflowActions.share,
              child: Text(appstrings.shareAction),
            ),
            const PopupMenuItem<HomeAppBarOverflowActions>(
              value: HomeAppBarOverflowActions.rate,
              child: Text(appstrings.rateAction),
            ),
            const PopupMenuItem<HomeAppBarOverflowActions>(
              value: HomeAppBarOverflowActions.what,
              child: Text(appstrings.appHomeAction),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
