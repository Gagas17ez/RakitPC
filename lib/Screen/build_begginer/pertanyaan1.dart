import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan2.dart';
import 'package:rakit_pc/global.dart' as global;

class Pertanyaan1 extends StatefulWidget {
  Pertanyaan1({Key? key}) : super(key: key);

  @override
  State<Pertanyaan1> createState() => _Pertanyaan1State();
}

class _Pertanyaan1State extends State<Pertanyaan1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertanyaan 1'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: const Card(
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Berapa Budget anda ?",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
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
                    MaterialPageRoute(builder: (context) => Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.budget = 1;
                    },
                  );
                },
                child: const Text('Button 1')),
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
                      global.budget = 2;
                    },
                  );
                },
                child: const Text('Button 2')),
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
                      global.budget = 3;
                    },
                  );
                },
                child: const Text('Button 2')),
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
                      global.budget = 4;
                    },
                  );
                },
                child: const Text('Button 2')),
          ),
        ],
      ),
    );
  }
}
