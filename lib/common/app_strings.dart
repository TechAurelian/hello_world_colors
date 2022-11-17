// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

/// String constants used in the user interface of the app.

const String appName = 'Hello World Colors';

// -----------------------------------------------------------------------------------------------
// Home Screen
// -----------------------------------------------------------------------------------------------

const String homeScreenTitle = 'Hello, World!';
const String homeFabTooltip = 'Next random color';
const String colorScreenActionTooltip = 'Full color screen';
const String infoScreenActionTooltip = 'Color info';
const String shareAction = 'Share...';
const String rateAction = 'Rate app';
const String appHomeAction = 'App homepage';

String shareText(String name, String code) => 'Hello, World! I\'m $name, and my code is $code.';

// -----------------------------------------------------------------------------------------------
// Info Screen
// -----------------------------------------------------------------------------------------------

const String infoScreenTitle = 'Color Info';

const String infoName = 'Name';
const String infoHex = 'Hex triplet';
const String infoRGB = 'RGB';
const String infoHSV = 'HSV';
const String infoHSL = 'HSL';
const String infoDecimal = 'Decimal';
const String infoLuminance = 'Luminance';
const String infoBrightness = 'Brightness';
const String infoCopy = 'copy';

String infoCopied(String value) => '$value copied to clipboard';
