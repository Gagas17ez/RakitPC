import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan2.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/stepper.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class Pertanyaan1 extends StatefulWidget {
  Pertanyaan1({Key? key}) : super(key: key);

  @override
  State<Pertanyaan1> createState() => _Pertanyaan1State();
}

class _Pertanyaan1State extends State<Pertanyaan1> {
  String button1color = "#DBD8E3";
  String button2color = "#DBD8E3";
  String button3color = "#DBD8E3";
  String button4color = "#DBD8E3";
  bool isDisable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#272B40"),
      // return ScaffoldGradientBackground(
      //   gradient: const LinearGradient(
      //     begin: Alignment.bottomRight,
      //     end: Alignment.topLeft,
      //     colors: [
      //       const Color(0xFFAE52BB),
      //       Color(0xFF0C062A),
      //     ],
      //   ),
      appBar: AppBar(
          title: const Text('Pertanyaan 1', textAlign: TextAlign.center),
          backgroundColor: HexColor("#0C062A")),
      body: Center(
        // padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
                height: 94,
                width: 327,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: HexColor("#DBD8E3"),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Berapa budget anda ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'SfM',
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    primary: HexColor(button1color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54), //////// HERE
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const Pertanyaan2()),
                    // );
                    setState(
                      () {
                        global.budget = 1;
                        button1color = "#8EE34B";
                        button2color = "#DBD8E3";
                        button3color = "#DBD8E3";
                        button4color = "#DBD8E3";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Mulai dari Rp4.000.000,00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'SfM',
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    primary: HexColor(button2color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54), //////// HERE
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const Pertanyaan2()),
                    // );
                    setState(
                      () {
                        global.budget = 2;
                        button1color = "#DBD8E3";
                        button2color = "#8EE34B";
                        button3color = "#DBD8E3";
                        button4color = "#DBD8E3";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Mulai dari Rp7.000.000,00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'SfM',
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    primary: HexColor(button3color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54), //////// HERE
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const Pertanyaan2()),
                    // );
                    setState(
                      () {
                        global.budget = 3;
                        button1color = "#DBD8E3";
                        button2color = "#DBD8E3";
                        button3color = "#8EE34B";
                        button4color = "#DBD8E3";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Mulai dari Rp10.000.000,00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'SfM',
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    primary: HexColor(button4color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54), //////// HERE
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const Pertanyaan2()),
                    // );
                    setState(
                      () {
                        global.budget = 4;
                        button1color = "#DBD8E3";
                        button2color = "#DBD8E3";
                        button3color = "#DBD8E3";
                        button4color = "#8EE34B";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Mulai dari Rp15.000.000,00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'SfM',
                    ),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding:
                const EdgeInsets.fromLTRB(0, 0, 0, 30),
              children: [
                Container(
                  // margin: const EdgeInsets.only(bottom: 70.0),
                  width: 70,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("7A77FF")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                    child: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const pertanyaan_awal()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  // margin: const EdgeInsets.only(bottom: 30.0),
                  width: 70,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("7A77FF")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {
                      isDisable
                          ? null
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pertanyaan2()),
                            );
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pertanyaan_awal()),
          );
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
