import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan2.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class Pertanyaan1 extends StatefulWidget {
  Pertanyaan1({Key? key}) : super(key: key);

  @override
  State<Pertanyaan1> createState() => _Pertanyaan1State();
}

class _Pertanyaan1State extends State<Pertanyaan1> {
  int? _value = 1;
  String button1color = "#DBD8E3";
  String button2color = "#DBD8E3";
  String button3color = "#DBD8E3";
  String button4color = "#DBD8E3";
  bool isDisable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#272B40"),
      // appBar: AppBar(
      //     title: const Text('Pertanyaan 1', textAlign: TextAlign.center),
      //     backgroundColor: HexColor("#0C062A")),
      body: Center(
        // padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: LinearPercentIndicator(
                width: 360,
                lineHeight: 30,
                percent: 66 / 100,
                animation: true,
                animationDuration: 1500,
                center: Text("2/3"),
                barRadius: Radius.circular(20),
                backgroundColor: HexColor("#C9C9C9"),
                progressColor: HexColor("#EE5584"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(top: 0, right: 220, left: 0, bottom: 0),
              height: 30,
              width: 310,
              alignment: Alignment.topLeft,
              child: Text(
                "Question 1",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: HexColor("#D7D7D7"),
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(top: 0, right: 110, left: 0, bottom: 5),
              height: 30,
              width: 310,
              alignment: Alignment.center,
              child: Text(
                "Berapakah budget anda ?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: HexColor("#D7D7D7"),
                  height: 1.5,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      global.budget = 1;
                    });

                    Navigator.pushNamed(context, '/build/begginer/pertanyaan2');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide(
                      color: HexColor("#C9C9C9"),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Rp 3.000.000 - Rp 6.0000.000",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left),
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      global.budget = 2;
                    });
                    Navigator.pushNamed(context, '/build/begginer/pertanyaan2');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide(
                      color: HexColor("#C9C9C9"),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Rp 6.100.000 - Rp 9.0000.000",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left),
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      global.budget = 3;
                    });
                    Navigator.pushNamed(context, '/build/begginer/pertanyaan2');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide(
                      color: HexColor("#C9C9C9"),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Rp 9.100.000 - Rp 15.0000.000",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left),
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      global.budget = 4;
                    });
                    Navigator.pushNamed(context, '/build/begginer/pertanyaan2');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide(
                      color: HexColor("#C9C9C9"),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Rp 15.0000.000 < ",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left),
                  ),
                )),
            SizedBox(height: 40),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pushNamed(context, '/buildAwal');
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: HexColor("#7A77FF"),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Inter',
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/build');
        },
        backgroundColor: HexColor("#7A77FF"),
        child: const Icon(
          Icons.build,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
