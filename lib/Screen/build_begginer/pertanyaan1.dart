import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan2.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/stepper.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class Pertanyaan1 extends StatefulWidget {
  Pertanyaan1({Key? key}) : super(key: key);

  @override
  State<Pertanyaan1> createState() => _Pertanyaan1State();
}

class _Pertanyaan1State extends State<Pertanyaan1> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          const Color(0xFFAE52BB),
          Color(0xFF0C062A),
        ],
      ),
      appBar: AppBar(
          title: const Text('Pertanyaan 1', textAlign: TextAlign.center),
          backgroundColor: HexColor("#0C062A")),
      body: ListView(
        padding: const EdgeInsets.all(20),
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
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Seberapa besar budget anda ??",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    height: 2.0,
                    fontFamily: 'SfM',
                  ),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 50, 5, 5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.budget = 1;
                    },
                  );
                },
                child: const Text('Mulai dari Rp4.000.000,00')),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.budget = 2;
                    },
                  );
                },
                child: const Text('Mulai dari Rp7.000.000,00')),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.budget = 3;
                    },
                  );
                },
                child: const Text('Mulai dari Rp10.000.000,00')),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.budget = 4;
                    },
                  );
                },
                child: const Text('Mulai dari Rp15.000.000,00')),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            children: [
              Container(
                width: 90,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(HexColor("7A77FF")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              Container(
                width: 90,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(HexColor("7A77FF")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))),
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    Navigator.push(
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
    );
  }
}
