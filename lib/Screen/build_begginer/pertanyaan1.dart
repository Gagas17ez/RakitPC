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
                percent: 66/100,
                animation: true,
                animationDuration: 1500,
                center: Text("2/3"),
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
              padding: EdgeInsets.only(
                  top: 0, right: 110, left: 0, bottom: 5),
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
              height: 80,
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
                        "Rp 1.000.000 - Rp 4.0000.000",
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
                        "Rp 4.100.000 - Rp 7.0000.000",
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
                        "Rp 7.100.000 - Rp 10.0000.000",
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
                        "Rp 10.100.000 - Rp 15.0000.000",
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
            SizedBox(height: 50),

            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              children: [
                Container(
                  // margin: const EdgeInsets.only(bottom: 70.0),
                  width: 50,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("FFAE52BB")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                    child: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, '/build');
                    },
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  // margin: const EdgeInsets.only(bottom: 30.0),
                  width: 50,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("FFAE52BB")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {
                      isDisable
                          ? null
                          : Navigator.pushNamed(
                              context, '/build/begginer/pertanyaan2');
                    },
                  ),
                ),
              ],
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
