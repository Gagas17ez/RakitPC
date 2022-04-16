import 'package:flutter/material.dart';
import 'package:rakit_pc/global.dart' as global;

class Pertanyaan2 extends StatefulWidget {
  Pertanyaan2({Key? key}) : super(key: key);

  @override
  State<Pertanyaan2> createState() => _Pertanyaan2State();
}

class _Pertanyaan2State extends State<Pertanyaan2> {
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
              child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Apa kegunaan dari komputer tersebut",
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
                child: const Text('Button 2')),
          ),
        ],
      ),
    );
  }
}
