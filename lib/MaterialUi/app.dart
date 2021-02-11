// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_playground/MaterialUi/backdrop.dart';
import 'package:flutter_playground/MaterialUi/category_menu_page.dart';
import 'package:flutter_playground/MaterialUi/model/product.dart';
import 'package:flutter_playground/MaterialUi/supplemental/cut_corners_border.dart';

import 'colors.dart';
import 'home.dart';
import 'login.dart';

class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(category: _currentCategory),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('Shrine'),
        backTitle: Text('Menu'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kShrinePink100,
        colorScheme: base.colorScheme.copyWith(
          secondary: kShrineBrown900,
        ),
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
      ),
      buttonBarTheme: base.buttonBarTheme.copyWith(
        buttonTextTheme: ButtonTextTheme.accent,
      ),
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: kShrinePink100,
      ),
      errorColor: kShrineErrorRed,
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: CutCornersBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: kShrineBrown900,
            ),
          ),
          border: CutCornersBorder()));
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}

ThemeData _buildShrineThemePurple() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kShrinePurple,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePurple,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light().copyWith(primary: kShrinePurple),
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0))),
    ),
    scaffoldBackgroundColor: kShrineSurfaceWhite,
    textTheme: _buildShrineTextThemePurple(base.textTheme),
    primaryTextTheme: _buildShrineTextThemePurple(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextThemePurple(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineSurfaceWhite),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrinePurple,
        ),
      ),
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildShrineTextThemePurple(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
      );
}
