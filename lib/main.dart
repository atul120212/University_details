import 'package:api_app/home.dart';
import 'package:flutter/material.dart';
import 'results.dart';


void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home': (context) => MyHome(),
      'results': (context) => MyResult(),
    },
  ));
}
