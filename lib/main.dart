// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/app_strings.dart' as appstrings;
import 'screens/home_screen.dart';

void main() {
  runApp(const HelloWorldColorsApp());
}

/// The root widget of the app.
class HelloWorldColorsApp extends StatelessWidget {
  const HelloWorldColorsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appstrings.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: const ColorScheme.light().surface,
          onPrimary: const ColorScheme.light().onSurface,
          secondary: const ColorScheme.light().surface,
          onSecondary: const ColorScheme.light().onSurface,
        ),
      ),
      // Dark Theme support
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          secondary: const ColorScheme.dark().surface,
          onSecondary: const ColorScheme.dark().onSurface,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
