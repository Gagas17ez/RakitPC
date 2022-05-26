import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/hasil_begginer.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/global.dart' as global;

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
      appBar: AppBar(
          title: const Text('Pertanyaan 2', textAlign: TextAlign.center),
          backgroundColor: HexColor("#0C062A")),
      body: Center(
        // padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
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
              height: 80,
            ),

            Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: HexColor("#C9C9C9"),),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 5, right: 5, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kerja /Browse / Video / Sekolah",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Radio(
                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      )
                    ],
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: HexColor("#C9C9C9"),),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 5, right: 5, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kuliah / Programming",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Radio(
                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      )
                    ],
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: HexColor("#C9C9C9"),),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 5, right: 5, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bermain game / Video editing",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Radio(
                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                        value: 3,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      )
                    ],
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: HexColor("#C9C9C9"),),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 5, right: 5, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Workstation",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Radio(
                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                        value: 4,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      )
                    ],
                  ),
                )),
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
                      Navigator.pushNamed(context, '/build/begginer/pertanyaan1');
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
                          context, '/build/begginer/hasil_beginner');
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
