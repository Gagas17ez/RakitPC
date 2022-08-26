import 'package:flutter/material.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class Pertanyaan1 extends StatefulWidget {
  const Pertanyaan1({Key? key}) : super(key: key);

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
      // appBar: AppBar(
      //     title: const Text('Pertanyaan 1', textAlign: TextAlign.center),
      //     backgroundColor: HexColor("#0C062A")),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.90,
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * 0.90,
                  lineHeight: 30,
                  percent: 50 / 100,
                  animation: true,
                  animationDuration: 500,
                  animateFromLastPercent: true,
                  barRadius: const Radius.circular(20),
                  backgroundColor: HexColor("#C9C9C9"),
                  progressColor: HexColor("#EE5584"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.77,
                alignment: Alignment.topLeft,
                child: Text(
                  "Pertanyaan  1",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.77,
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Berapakah budget anda ?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.white,
                    height: 1.5,
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

                      Navigator.pushNamed(
                          context, '/build/begginer/pertanyaan2');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Rp 3.000.000 - Rp 6.0000.000",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  )),
              const SizedBox(height: 20),
              Container(
                  height: 40,
                  width: 320,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        global.budget = 2;
                      });
                      Navigator.pushNamed(
                          context, '/build/begginer/pertanyaan2');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Rp 6.100.000 - Rp 9.0000.000",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  )),
              const SizedBox(height: 20),
              Container(
                  height: 40,
                  width: 320,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        global.budget = 3;
                      });
                      Navigator.pushNamed(
                          context, '/build/begginer/pertanyaan2');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Rp 9.100.000 - Rp 15.0000.000",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  )),
              const SizedBox(height: 20),
              Container(
                  height: 40,
                  width: 320,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        global.budget = 4;
                      });
                      Navigator.pushNamed(
                          context, '/build/begginer/pertanyaan2');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("≥ Rp 15.0000.000",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  )),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('Kembali'),
                onPressed: () {
                  Navigator.pushNamed(context, '/buildAwal');
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: HexColor("#7A77FF"),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16.0,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
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
