import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/widgets.dart';


import 'package:rakit_pc/Screen/build_advanced/build_advanced_new.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class pertanyaan_awal extends StatefulWidget {
  const pertanyaan_awal({Key? key}) : super(key: key);

  @override
  _pertanyaan_awal createState() => _pertanyaan_awal();
}

class _pertanyaan_awal extends State<pertanyaan_awal> {
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
              height: 390,
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
                        "Ya",
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
                        "Tidak",
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
            SizedBox(height: 30),

            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: HexColor("#FFAE52BB"),
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
    );
  }
}


