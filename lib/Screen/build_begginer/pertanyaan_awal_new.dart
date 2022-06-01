import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/widgets.dart';

import 'package:rakit_pc/Screen/build_advanced/build_advanced_new.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class pertanyaanAwalNew extends StatefulWidget {
  pertanyaanAwalNew({Key? key}) : super(key: key);

  @override
  State<pertanyaanAwalNew> createState() => _pertanyaanAwalNewState();
}

class _pertanyaanAwalNewState extends State<pertanyaanAwalNew> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#272B40"),
      appBar: AppBar(
        backgroundColor: HexColor("#0C062A"),
        title: const Text("Rakit PC", textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 300,
              alignment: Alignment.center,
              child: Text(
                "Apakah anda berpengalaman di bidang komputer ? ",
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
              height: 300,
            ),
            Container(
                height: 40,
                width: 320,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {},
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
                    child: Text("Ya",
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
                  onPressed: () {},
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
                    child: Text("Tidak",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: HexColor("#D7D7D7"),
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.left),
                  ),
                )),
            SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {},
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
