import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';
import 'package:rakit_pc/coba.dart';
import 'package:rakit_pc/global.dart' as global;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuWisatapi(),
    );
  }
}
