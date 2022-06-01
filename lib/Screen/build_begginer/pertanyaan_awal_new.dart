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
      backgroundColor: HexColor("#0C062A"),
      appBar: AppBar(
        backgroundColor: HexColor("#0C062A"),
        title: const Text("How it Works", textAlign: TextAlign.center),
        leading: BackButton(
          color: Colors.white,
        ),

      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 40,
                  ),
                  Container(
                      height: 100,
                      child: Text(
                        "Step 1: ",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  Container(
                    height: 100,
                    width: 30,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      child: Text(
                        "Kita akan bertanya beberapa pertanyaan untuk memahami kebutuhanmu",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Container(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 40,
                  ),
                  Container(
                    height: 100,
                    child: Text(
                      "Step 2: ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        height: 1.5,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 30,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      child: Text(
                        "Memberikan rekomendasi komponen PC sesuai jawaban ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          height: 1.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 40,
                  ),
                ],
              ),
            ),

            SizedBox(height: 230),
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
