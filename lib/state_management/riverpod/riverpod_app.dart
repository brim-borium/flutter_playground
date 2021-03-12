import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_playground/state_management/riverpod/screens/RiverpodHomePage.dart';

TextStyle textStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

class RiverpodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Riverpod Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RiverpodHomePage());
  }
}
