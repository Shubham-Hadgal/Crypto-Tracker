import 'package:crypto_app/more_details.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/more_details': (context) => const MoreDetails(),
      },
  ));
}