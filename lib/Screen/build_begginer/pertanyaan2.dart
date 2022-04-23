import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/hasil_begginer.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/global.dart' as global;

import 'package:hexcolor/hexcolor.dart';

class Pertanyaan2 extends StatefulWidget {
  const Pertanyaan2({Key? key}) : super(key: key);

  @override
  State<Pertanyaan2> createState() => _Pertanyaan2State();
}

class _Pertanyaan2State extends State<Pertanyaan2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#272B40"),
      appBar: AppBar(
          title: Text('Pertanyaan 2', textAlign: TextAlign.center),
          backgroundColor: HexColor("#272B40")),
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
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Apa kegunaan dari komputer tersebut ??",
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
                  setState(
                    () {
                      global.kegunaan = 1;
                    },
                  );
                },
                child: const Text('Penggunaan ringan Browser/Sekolah/Kerja')),
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
                    MaterialPageRoute(builder: (context) => Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.kegunaan = 2;
                    },
                  );
                },
                child: const Text('Penggunaan moderate Kuliah/Programming')),
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
                    MaterialPageRoute(builder: (context) => Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.kegunaan = 3;
                    },
                  );
                },
                child: const Text('Penggunaan berat Gaming/3D/Video Editing')),
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
                    MaterialPageRoute(builder: (context) => Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.kegunaan = 4;
                    },
                  );
                },
                child: const Text(
                    'Pengunaan sangat berat Workstation/MachineLearning/Server')),
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
                  child: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pertanyaan_awal()),
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
                  child: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rekomendasi_pc()),
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
