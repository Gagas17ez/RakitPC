import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/widgets.dart';
import 'package:rakit_pc/Screen/build_advanced/build_advanced.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';

class pertanyaan_awal extends StatelessWidget {
  const pertanyaan_awal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#272B40"),
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 165,
              width: 327,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: const Text(
                "Sebelum memulai, apakah anda berpengalaman dalam bidang komputer ? ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  height: 2.0,
                  fontFamily: 'SfM',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              children: [
                Container(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("8EE34B")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ))),
                    child: Text(
                      "Ya",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => build_advanced()),
                      );
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("D6B2B0")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ))),
                    child: Text(
                      "Tidak",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pertanyaan1()),
                      );
                    },
                  ),
                  // child: RaisedButton(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(32)),
                  //   child: const Text(
                  //     "Tidak",
                  //     style: TextStyle(fontSize: 20),
                  //   ),
                  //   textColor: Colors.black,
                  //   color: HexColor("D6B2B0"),
                  //   onPressed: () {},
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}