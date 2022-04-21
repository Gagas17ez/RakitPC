import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Page1(),
    ),
  );
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

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
              child: const Text("Sebelum memulai, apakah anda berpengalaman dalam bidang komputer ? ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  height: 2.0,
                  fontFamily: 'SfM',
                ),
              ),
            ),
            const SizedBox(height: 30,),

            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding:const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10
              ),
              children: [
                Container(
                  width: 100,
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    child: const Text("Ya",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    textColor: Colors.black,
                    color: HexColor("8EE34B"),
                    onPressed: (){},
                  ),
                ),

                Container(
                  width: 100,
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    child: const Text("Tidak",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    textColor: Colors.black,
                    color: HexColor("D6B2B0"),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
