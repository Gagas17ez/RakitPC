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
              height: 50,
            ),
            Container(
                height: 104,
                width: 327,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: HexColor("#DBD8E3"),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "Apa kegunaan dari komputer tersebut ??",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      height: 1.5,
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
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    primary: HexColor(button1color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54),
                    maximumSize: const Size(319, 84),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Rekomendasi_pc()),
                    // );
                    setState(
                      () {
                        global.kegunaan = 1;
                        button1color = "#8EE34B";
                        button2color = "#DBD8E3";
                        button3color = "#DBD8E3";
                        button4color = "#DBD8E3";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Penggunaan ringan Browser/Sekolah/Kerja',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
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
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    primary: HexColor(button2color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54),
                    maximumSize: const Size(319, 84),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Rekomendasi_pc()),
                    // );
                    setState(
                      () {
                        global.kegunaan = 2;
                        button1color = "#DBD8E3";
                        button2color = "#8EE34B";
                        button3color = "#DBD8E3";
                        button4color = "#DBD8E3";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Penggunaan moderate Kuliah/Programming',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
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
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    primary: HexColor(button3color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54),
                    maximumSize: const Size(319, 84),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Rekomendasi_pc()),
                    // );
                    setState(
                      () {
                        global.kegunaan = 3;
                        button1color = "#DBD8E3";
                        button2color = "#DBD8E3";
                        button3color = "#8EE34B";
                        button4color = "#DBD8E3";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Penggunaan berat Gaming/3D/Video Editing',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
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
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    primary: HexColor(button4color),
                    // onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: const Size(319, 54),
                    maximumSize: const Size(319, 84),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Rekomendasi_pc()),
                    // );
                    setState(
                      () {
                        global.kegunaan = 4;
                        button1color = "#DBD8E3";
                        button2color = "#DBD8E3";
                        button3color = "#DBD8E3";
                        button4color = "#8EE34B";
                        isDisable = false;
                      },
                    );
                  },
                  child: const Text(
                    'Pengunaan sangat berat Workstation/MachineLearning/Server',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'SfM',
                    ),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              // buttonPadding:
              //     const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 70.0),
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
                        MaterialPageRoute(builder: (context) => Pertanyaan1()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 70.0),
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
                                  builder: (context) => Rekomendasi_pc()),
                            );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
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
            MaterialPageRoute(builder: (context) => Pertanyaan1()),
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
