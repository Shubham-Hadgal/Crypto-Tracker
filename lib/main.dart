import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
      },
  ));
}