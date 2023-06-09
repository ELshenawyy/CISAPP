import 'package:cis_team/board.dart';
import 'package:cis_team/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Board(),
      debugShowCheckedModeBanner: false,
    routes: {
      'board': (context) => const Board(),
    },

    );
  }
}
