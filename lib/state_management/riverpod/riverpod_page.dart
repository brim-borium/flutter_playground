import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle textStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

class RiverpodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Text('Hello', style: textStyle),
        ),
      ),
    );
  }
}
