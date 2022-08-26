import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class PertanyaanAwal extends StatefulWidget {
  const PertanyaanAwal({Key? key}) : super(key: key);

  @override
  _PertanyaanAwal createState() => _PertanyaanAwal();
}

class _PertanyaanAwal extends State<PertanyaanAwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#272B40"),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.90,
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * 0.90,
                  lineHeight: 30,
                  percent: 25 / 100,
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
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.79,
                    height: MediaQuery.of(context).size.height * 0.10,
                    alignment: Alignment.center,
                    child: Text(
                      "Apakah anda sudah berpengalaman di bidang komputer ? ",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.36,
                  ),
                  Container(
                      height: 40,
                      width: 320,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/build/advanced');
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
                          child: Text("Sudah",
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
                          Navigator.pushNamed(
                              context, '/build/begginer/pertanyaan1');
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
                          child: Text("Belum",
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
                      Navigator.pushNamed(context, '/');
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
                ],
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
