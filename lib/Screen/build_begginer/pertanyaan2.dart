import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/hasil_begginer.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:percent_indicator/percent_indicator.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class Pertanyaan2 extends StatefulWidget {
  const Pertanyaan2({Key? key}) : super(key: key);

  @override
  State<Pertanyaan2> createState() => _Pertanyaan2State();
}

class _Pertanyaan2State extends State<Pertanyaan2> {
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
      //     title: const Text('Pertanyaan 2', textAlign: TextAlign.center),
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
                percent: 100/100,
                animation: true,
                animationDuration: 1500,
                center: Text("3/3"),
                barRadius: Radius.circular(20),
                backgroundColor: HexColor("#C9C9C9"),
                progressColor:HexColor("#EE5584"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 0, right: 220, left: 0, bottom: 0),
              height: 30,
              width: 310,
              alignment: Alignment.center,
              child: Text(
                "Question 2",
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
              padding: EdgeInsets.only(
                  top: 0, right: 0, left: 5, bottom: 5),
              height: 30,
              width: 310,
              alignment: Alignment.topLeft,
              child: Text(
                "Apa kegunaan dari komputer tersebut ?",
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
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide( color: HexColor("#C9C9C9"),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Kerja /Browse / Video / Sekolah",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
                )
            ),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide( color: HexColor("#C9C9C9"),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Kuliah / Programming",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
                )
            ),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide( color: HexColor("#C9C9C9"),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Bermain game / Video editing",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
                )
            ),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    side: BorderSide( color: HexColor("#C9C9C9"),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Workstation",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
                )
            ),
            SizedBox(height: 40),

            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {Navigator.pushNamed(context, '/build/begginer/pertanyaan1');},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: HexColor("#7A77FF"),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  textStyle:
                  const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Inter',
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/build/begginer/pertanyaan1');
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
