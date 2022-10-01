import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/home_screen/find_route.dart';
import 'package:krl_info/screens/login/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KRL-Info',
      theme: ThemeData().copyWith(
        colorScheme: const ColorScheme.light(primary: primColor),
      ),
      home: const FindRoute(),
    );
  }
}
