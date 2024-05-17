import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neobis_project_http/pages/home.dart';

void main() {
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stack) {
      print('runZonedGuarded: Caught error in my root zone.');
      print(error);
      print(stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http requests',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
